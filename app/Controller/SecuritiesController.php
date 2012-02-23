<?php
class SecuritiesController extends AppController {
    public $name = 'Security';
	var $components = array('Crypt');
	private $data;

	private $app_model;
	private $key_model;

	private $return_id_on_save = true;
//	public function __construct($request = null, $response = null)
//	{
//		//parent::__construct($request = null, $response = null);
//
//
//	}

	function index()
	{
		// validate input data
		if(!$this->__validate()) {
			throw new CakeException('No Data provided.');

		}
		if (!$this->__loadModels()) {
			throw new CakeException('Required model files are missing.');
		}

		// call method which is passed in i,e, __read or __save
		$this->{"__".$this->data['m']}();

		die('reached here successfully');
	}

	private function __validate()
	{
		// somehow RequestHandler is not working ... taking easier root for now
		if(isset($_SERVER['REQUEST_METHOD'])) {
			echo "INSIDE >> ";
			$method = $_SERVER['REQUEST_METHOD'];
			// check method of request
			if ($method == "POST") {
				$data = $_POST['data'];
			} elseif ($method == "GET") {
				$data = $_GET['data'];
			} else {
				throw new CakeException('No Data praaaaaaaaovided.',101);
				return false;
			}
		}

		// check if Security.use_baseencode is set to true, if yes decode the values.
		if (Configure::read("Security.use_baseencode") === true) {
			$data = base64_decode($data);
		}

		// check if Security.use_salt is set to true - whether to use salt key or not
		// not implemented for now

		// check if valid jason
		$request = unserialize(stripslashes($data));
		if ($request == NULL) {
			return false;
		} else {
			$this->data = $request['request'];
		}

		// check if method , tablename and fields are provided (for more than one requests at a time)
		if (!isset($this->data['m']) || !isset($this->data['t']) || !isset($this->data['f']) || (($this->data['m'] == "read") && !isset($this->data['w']))) {
			throw new CakeException('Improper data.');
			return false;
		}

		// check if method provided is valid
		if ($this->data['m'] <> "read" && $this->data['m'] <> "save") {
			throw new CakeException('Invalid method.');
			return false;
		}
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
			throw new CakeException('Model '.$app_model_name.' is missing.');
			return false;
		}

		// load key side model for given table
		App::import('Model', $key_model_name);
		if(class_exists($key_model_name)) {
			$this->key_model = new $key_model_name;
		} else {
			throw new CakeException('Model '.$key_model_name.' is missing.');
			return false;
		}
		return true;
	}

	private function __read() {
		$fields = implode(",", $this->data['f']);

		// check if where clause is an array, if yes extract primary key field
		if (is_array($this->data['w'])) {
			$id = $this->data['w'][$this->app_model->primaryKey];
		} else {
			$id = $this->data['w'];
		}

		// find key for this id 
		$key_data = $this->key_model->read('key',$id);
		echo "<br> pass key =>".$passkey = $key_data[$this->key_model->name]['key'];

		$t_data = array();
		$app_data = $this->app_model->read($fields,$id);
		foreach ($app_data[$this->app_model->name] as $key => $val) {
			echo "<br>Key >> ".$key. "   value >> ".$val;
			if ($key <> $this->app_model->primaryKey) { // exclude primary ids
				// decrypt
				$t_data[$key] = $this->Crypt->setPassKey($passkey)->decrypt($val);
			}
		}

		
		

		pr($t_data);
	}


	private function __save()
	{
		$tmp_data =array();
		$update_existing = false;
		if (isset($this->data['w'])) {
			if(count($this->data['w']) > 0) { // this is meant to be an array
				// request is to update the data
				if (!$this->app_model->allow_update === true) {
					throw new CakeException('Updating existing values for '.$this->app_model->name.' is not supported.');
					return false;
				} else if (!isset($this->data['w'][$this->app_model->primaryKey])) { // if where condition does not provide primary id in field list its error
					throw new CakeException('Expected primary key in where clause.');
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
			echo "<br> Key >> ".$key. "   O.val ==".$val."    C.Val==".$crypt_val;
		}

		// check if existing record b\needs to be updated
		if($update_existing === true) { //set [primary id in array
			$tmp_data[$this->app_model->primaryKey] = $this->data['w'][$this->app_model->primaryKey];
		}

		$app_save_data = array( $this->app_model->name => $tmp_data );
		$r = $this->app_model->save($app_save_data);

		if ($update_existing === true) {
			$id = $this->data['w'][$this->app_model->primaryKey];
		} else {
			$id = $r[$this->app_model->name][$this->app_model->primaryKey];
		}


		$key_save_data = array(
							$this->app_model->primaryKey => $id, //id
							'key' => $passkey,
						);
		$this->key_model->save($key_save_data);

		//$key_save_data;
		//pr($app_save_data);
	} // end function

	function test()
	{
		//AsewD7IsLyuuq5dz82cVxmdBjNbB7Zyzd6ZIpqUebPI=|yp7XYjlGCWlwW4Az0I/RSH0j7XtYsHW+h/MPWCAxoTw=

		//echo $this->Crypt->setPassKey("QxtP3uKrshBtWKLF1L09OVdTCw2grPHr")->encrypt("1212232332322121");

		echo $this->Crypt->setPassKey("QxtP3uKrshBtWKLF1L09OVdTCw2grPHr")->decrypt("odp5o+9RXqBsREKWl/x1z7s+DBwkNKzowLNJCCCMDP0=|3QEtJt56XrVPOuPWio+ELH9BE4/j1+84GefDrev2D4E=");// AsewD7IsLyuuq5dz82cVxmdBjNbB7Zyzd6ZIpqUebPI=|yp7XYjlGCWlwW4Az0I/RSH0j7XtYsHW+h/MPWCAxoTw=");
	}

}
