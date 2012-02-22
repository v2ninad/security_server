<?php
class SecuritiesController extends AppController {
    public $name = 'Security';
	var $components = array('Crypt');


	function index() {

		// check if Security.use_salt is set to true - whether to use salt key or not

		// check if Security.use_baseencode is set to true, if yes decode the values.

		// get the table namepassed from source

		// check which model in our code base need to be used i.e. Inflector::camelize($table_name)

		// find out table for keys i.e. Inflector::singularize("credit_cards")."_keys";

		// find out Model for key table i.e. Inflector::camelize($key_table)

		//

		$this->Crypt->setPassKey('ninad');
		//echo $crypt = $this->Crypt->encrypt("Desai");
		$value = "qXIePqZP4QcV8cNuc6U+x/l508PHVsPRuNOwT6Xn8Wo=|MquQWLdNCsaYYwRuuMdvH0O4Yk6c8Nl5jM2feoWh16Q=";
		echo $crypt = $this->Crypt->decrypt($value);
		die;
	}
}
