<?php
class CreditDetail extends AppModel {
	var $name = 'CreditDetail';

	// this property decides, if primary id is to send back to aplication upon saved
	var $return_id_on_save = true;

	// this allows to update existing values (encrypted). i.e. credit card number cant be updated so will be false in that case .
	// but insurance policy number can be updated after one year so will be true in that case
	var $allow_update = true;

	//var $primaryKey = "id";


	

}
