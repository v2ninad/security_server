<?php
class SecuritiesController extends AppController {
    public $name = 'Security';
	var $components = array('Crypt');
	var $autoRender = false;

	private $data;

	private $app_model;
	private $key_model;
	private $return_data;
	private $err = "";
	private $errno = 101;

	private $use_baseencode = true;

	//private $return_id_on_save = true;
//	public function __construct($request = null, $response = null)
//	{
//		//parent::__construct($request = null, $response = null);
//
//
//	}

	function index()
	{

		// validate input data
//
//
//		if (!$this->__validate()) {
//
//			$this->__handleError();
//		}
//
//		if (!$this->__loadModels()) {
//			$this->__handleError();
//		}
//
//		// call method which is passed in i,e, __read or __save
//		if(!$this->{"__".$this->data['m']}()) {
//			$this->__handleError();
//		}
		
		if(!$this->__validate() // validate input data
				||
			!$this->__loadModels() // load app model and key model based on table data is passed
				||
			!$this->{"__".$this->data['m']}() // call passed method routine in i,e, __read or __save
		) {
			$this->__handleError();

		}

		$this->__sendResult();
		//die('reached here successfully');
	}

	private function __validate()
	{
		// somehow RequestHandler is not working ... taking easier root for now
		if(isset($_SERVER['REQUEST_METHOD'])) {
#			echo "INSIDE >> ";
			$method = $_SERVER['REQUEST_METHOD'];
			// check method of request
			if ($method == "POST" && isset($_POST['data'])) {
				$data = $_POST['data'];
			} elseif ($method == "GET" && isset($_GET['data'])) {
				$data = $_GET['data'];
			} else {
				$this->err = 'No Data provided.';
				return false;
			}
		}
		//echo "<br>"."<br>"."<br>".$data."<br>";
		file_put_contents("/tmp/cc_server.log",  "B4 1 ".print_r($data,true),FILE_APPEND);

		// check if Security.use_baseencode is set to true, if yes decode the values.
		if ($this->use_baseencode === true) {
			$data = base64_decode($data);
		}

		// check if Security.use_salt is set to true - whether to use salt key or not
		// not implemented for now

		// check if valid jason
		file_put_contents("/tmp/cc_server.log",  "\n\n\nafter decode \n ".print_r($data,true),FILE_APPEND);
		$request = unserialize(stripslashes($data));
		file_put_contents("/tmp/cc_server.log",  "\n\n\nprint_r \n ".print_r($request,true),FILE_APPEND);
		if ($request == NULL) {
			return false;
		} else {
			$this->data = $request['request'];
		}

		// check if method , tablename and fields are provided (for more than one requests at a time)
		if (!isset($this->data['m']) || !isset($this->data['t']) || !isset($this->data['f']) || (($this->data['m'] == "read") && !isset($this->data['w']))) {
			$this->err = 'Improper data.';
			return false;
		}

		// check if method provided is valid
		if ($this->data['m'] <> "read" && $this->data['m'] <> "save") {
			$this->err = 'Invalid method.';
			return false;
		}

		//pr($this->data);
		return true;
	}

	private function __loadModels() {
		$app_model_name = Inflector::camelize(Inflector::singularize($this->data['t']));
		$key_model_name = Inflector::camelize(Inflector::singularize($this->data['t'])."_key");

		// load app side model for given table
		App::import('Model', $app_model_name);
		// We need to load the class
		if(class_exists($app_model_name)) {
			$this->app_model = new $app_model_name;
		} else {
			$this->err = 'Model '.$app_model_name.' is missing.';
			return false;
		}

		// load key side model for given table
		App::import('Model', $key_model_name);
		if(class_exists($key_model_name)) {
			$this->key_model = new $key_model_name;
		} else {
			$this->err = 'Model '.$key_model_name.' is missing.';
			return false;
		}
		return true;
	}

	private function __read() {
		$fields = implode(",", $this->data['f']);

		// check if where clause is an array, if yes extract primary key field
		if(!isset($this->data['w'][$this->app_model->primaryKey]) || !isset($this->data['w']['key_id'])) {
			$this->err = 'Insufficient Data.';
			return false;
		}
		
		// app_id 
		$id = $this->data['w'][$this->app_model->primaryKey];
		$key_id = $this->data['w']['key_id'];


		// find key for this id 
		$key_data = $this->key_model->read('key',$key_id);
		$passkey = $key_data[$this->key_model->name]['key'];

		$t_data = array();
		$app_data = $this->app_model->read($fields,$id);
		foreach ($app_data[$this->app_model->name] as $key => $val) {
			//echo "<br>Key >> ".$key. "   value >> ".$val;
			if ($key <> $this->app_model->primaryKey) { // exclude primary ids
				// decrypt
				$t_data[$key] = $this->Crypt->setPassKey($passkey)->decrypt($val);
			}
		}
		$this->return_data = $this->__maskOutput($t_data);
		//pr($this->return_data);
		return true;
	}


	private function __save()
	{
		$tmp_data =array();
		$update_existing = false;
		if (isset($this->data['w'])) {
			if(count($this->data['w']) > 0) { // this is meant to be an array
				// request is to update the data
				if (!$this->app_model->allow_update === true) {
					$this->err = 'Updating existing values for '.$this->app_model->name.' is not supported.';
					return false;
				} else if (!isset($this->data['w'][$this->app_model->primaryKey])) { // if where condition does not provide primary id in field list its error
					$this->err = 'Expected primary key in where clause.';
					return false;
				} else {
					$update_existing = true;
				}
			}
		}

		$passkey = $this->Crypt->keygen();
		foreach ($this->data['f'] as $key => $val) {
			// encrypt every provided field
			$crypt_val = $this->Crypt->setPassKey($passkey)->encrypt($val);
			$tmp_data[$key] = $crypt_val;
			#echo "<br> Key >> ".$key. "   O.val ==".$val."    C.Val==".$crypt_val;
		}

		// check if existing record b\needs to be updated
		if($update_existing === true) { //set [primary id in array
			$tmp_data[$this->app_model->primaryKey] = $this->data['w'][$this->app_model->primaryKey];
		}

		$app_save_data = array( $this->app_model->name => $tmp_data );
		$rapp = $this->app_model->save($app_save_data);
//		pr($rapp);
		if ($update_existing === true) {
			$id = $this->data['w'][$this->app_model->primaryKey];
		} else {
			//$id = $rapp[$this->app_model->name][$this->app_model->primaryKey];
			$id = NULL;
		}


		$key_save_data = array(
							$this->app_model->primaryKey => $id, //id
							'key' => $passkey,
						);
		$rkey = $this->key_model->save($key_save_data);
//		pr($rkey);
		$this->return_data = array(
							'id'=>$rapp[$this->app_model->name][$this->app_model->primaryKey],
							'key'=>$rkey[$this->key_model->name][$this->key_model->primaryKey]
					);
		//$key_save_data;
		//pr($app_save_data);
		return true;
	} // end function


	function __maskOutput($arr)
	{
		//pr($arr);
		if (!is_array($arr)) {
			$this->__handleError('Internal Error.');
			return false;
		}

		foreach ($arr as $key=>$val) {

			$this->loadModel("MaskedField");
			$masked_val = "";
			$conditions = array("field_name" => $key);
			$masked_pattern_arr = $this->MaskedField->find("first",array("fields" => array("masked_pattern"), "conditions" => $conditions));
			$pattern = $masked_pattern_arr[$this->MaskedField->name]['masked_pattern'];
			if (!empty($pattern)) {
				// this logic needs some improvement... right now its very naive to go through every character .. but saving my time for now.
				$len = strlen($pattern);
				$counter = 0;
				for ($i=0; $i<$len;$i++) {	// loop for every character
					if(!isset($val[$i-$counter])) { // check if val string still contains character to follow pattern
						break;
					}

					if ($pattern[$i] === "X") {
						// block visibility if pattern says X
						$masked_val .= "X";
					} else if ($pattern[$i] === "-" || $pattern[$i] === "/" || $pattern[$i] === "\\" || $pattern[$i] === " ") { // spare and include whitespaces
						// include whitespaces in format
						$masked_val .= $pattern[$i];
						$counter++;
					} else {
						// preserve original chars if pattern says 0
						$masked_val .= $val[$i-$counter];
					}
				}
				$arr[$key] = $masked_val;
			}
		}
		return $arr;
	}


	private function __handleError($err='',$errno=0)
	{
		echo "ERR >> ".$err. " errno >> ".$errno;
		if (empty($err)) {
			$err = $this->err;
		}
		if (empty($errno)) {
			$err = $this->errno;
		}

		/// simple error handling right now.
		$arr = array($errno,$err);
		echo "inside ";
		pr($arr);
		//$this->return_data = $arr;//base64_encode(serialize($arr));

	}

	private function __sendResult()
	{
		//pr($this->return_data);
		echo base64_encode(serialize($this->return_data));
	}

	function test()
	{
		

		//AsewD7IsLyuuq5dz82cVxmdBjNbB7Zyzd6ZIpqUebPI=|yp7XYjlGCWlwW4Az0I/RSH0j7XtYsHW+h/MPWCAxoTw=

		//echo $this->Crypt->setPassKey("QxtP3uKrshBtWKLF1L09OVdTCw2grPHr")->encrypt("1212232332322121");

		//echo $this->Crypt->setPassKey("QxtP3uKrshBtWKLF1L09OVdTCw2grPHr")->decrypt("odp5o+9RXqBsREKWl/x1z7s+DBwkNKzowLNJCCCMDP0=|3QEtJt56XrVPOuPWio+ELH9BE4/j1+84GefDrev2D4E=");// AsewD7IsLyuuq5dz82cVxmdBjNbB7Zyzd6ZIpqUebPI=|yp7XYjlGCWlwW4Az0I/RSH0j7XtYsHW+h/MPWCAxoTw=");
	}

	function decode ($str='') {
		if(empty($str)) {
			echo "<br>empty<br>";
			$str = "YTozOntzOjk6ImNjX251bWJlciI7czoyNDoiOTFYWC0tLVhYWC0tWFhYWC0tLVgyMzEyIjtzOjc6ImNjX25hbWUiO3M6ODoiSm9obiBEb2UiO3M6MTE6ImNjX2V4cF9kYXRlIjtzOjEwOiIwMS8wMS8yMDAxIjt9";
		}
		$stra = base64_decode($str);
		$arr = unserialize($stra);

		pr($arr);
	}

}
