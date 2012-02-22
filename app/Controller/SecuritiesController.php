<?php
class SecuritiesController extends AppController {
    public $name = 'Security';
	var $components = array('Crypt');
	var $data;

	public function __construct($request = null, $response = null)
	{
		parent::__construct($request = null, $response = null);


	}

	function index()
	{
		// validate input data
		if(!$this->__validateData()) {
			throw new CakeException('No Data provided.');

		}


		// get the table_name passed by source

		// check which model in our code base need to be used i.e. Inflector::camelize($table_name)

		// find out table for keys i.e. Inflector::singularize("credit_cards")."_keys";

		// find out Model for key table i.e. Inflector::camelize($key_table)

		//

	}

	private function __validateData()
	{

		// somehow RequestHandler is not working ... taking easier root for now
		$method = $_SERVER['REQUEST_METHOD'];
		// check method of request
		if ($method == "post") {
			$data = $_POST;
		} elseif ($method == "get") {
			$data = $_GET;
		} else {
			throw new CakeException('No Data providedaa.',101);
			return false;
		}

		// check if Security.use_baseencode is set to true, if yes decode the values.
		if (Configure::read("Security.use_baseencode") === true) {
			$data = base64_decode($data);
		}

		// check if Security.use_salt is set to true - whether to use salt key or not
		// not implemented for now

		// check if valid jason
		$this->data = json_decode($data);
		if ($this->data == NULL) {
			return false;
		}

		// check if method , tablename and fields are provided (for more than one requests at a time)
		foreach ($this as $key => $val) {
			if (!isset($val['m']) || !isset($val['t']) || !isset($val['f'])) {
				throw new CakeException('Improper data.');
				return false;
			}
		}
		
	}
}
