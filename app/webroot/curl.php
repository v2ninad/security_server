<?
	//// is cURL installed yet?
    if (!function_exists('curl_init')){
        die('Sorry cURL is not installed!');
    }

    // OK cool - then let's create a new cURL resource handle
    $ch = curl_init();

    // Now set some options (most are optional)
	$Url = "http://cc_server/securities";
    // Set URL to download
    curl_setopt($ch, CURLOPT_URL, $Url);

//$data = array('request' =>
//				array (
//					'm' => 'save',
//					't' => 'credit_details',
//					'f' => array(
//						'cc_number'=>'9102983312312312',
//						'cc_name'=>'John Doe',
//						'cc_exp_date'=>'01/01/2001',
//					),
//					//'w' => array('id' => 1),
//				),
//		);


//	$data = array('request' =>
//				array (
//					'm' => 'read',
//					't' => 'credit_details',
//					'f' => array(
//						'cc_number',
//						'cc_name',
//						'cc_exp_date',
//					),
//					'w' => array(
//								'id' => 20,
//								'key_id' => '4f475d56-15dc-4cc3-9fe3-233acbdd56cb'
//						),
//				),
//		);

$data = Array
(
    'request' => Array
        (
            'm' => 'save',
            't' => 'credit_details',
            'f' => Array
                (
                    'cc_number' => '9102983312111222',
                    'cc_name' => 'Amit Gandhi',
                    'cc_exp_date' => '01/01/2012',
                ),

        )

);

$data_json = base64_encode(serialize($data));
//$data_json = serialize($data);

//$data_json = "YToxMTp7czoxMDoiY29uZGl0aW9ucyI7TjtzOjY6ImZpZWxkcyI7TjtzOjU6ImpvaW5zIjthOjA6e31zOjU6ImxpbWl0IjtOO3M6Njoib2Zmc2V0IjtOO3M6NToib3JkZXIiO2E6MTp7aTowO047fXM6NDoicGFnZSI7aToxO3M6NToiZ3JvdXAiO047czo5OiJjYWxsYmFja3MiO2I6MTtzOjc6InJlcXVlc3QiO2E6NDp7czoxOiJtIjtzOjQ6InJlYWQiO3M6MToidCI7czoxNDoiY3JlZGl0X2RldGFpbHMiO3M6MToiZiI7YTozOntpOjA7czo5OiJjY19udW1iZXIiO2k6MTtzOjc6ImNjX25hbWUiO2k6MjtzOjExOiJjY19leHBfZGF0ZSI7fXM6MToidyI7YToyOntzOjI6ImlkIjtpOjIwO3M6Njoia2V5X2lkIjtzOjM2OiI0ZjQ3NWIwMy1lNjJjLTQyOGQtYWFjMi0yMzNhY2JkZDU2Y2IiO319czoxMToicmVzdF9tZXRob2QiO3M6NDoicG9zdCI7fQ==";

curl_setopt($ch, CURLOPT_POSTFIELDS,  "data=".$data_json);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_POST, 1);
$a = curl_exec($ch);
curl_close($ch);



//    // Set a referer
//    curl_setopt($ch, CURLOPT_REFERER, "http://www.example.org/yay.htm");
//
//    // User agent
//    curl_setopt($ch, CURLOPT_USERAGENT, "MozillaXYZ/1.0");
//
//    // Include header in result? (0 = yes, 1 = no)
//    curl_setopt($ch, CURLOPT_HEADER, 0);
//
//    // Should cURL return or print out the data? (true = return, false = print)
//    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//
//    // Timeout in seconds
//    curl_setopt($ch, CURLOPT_TIMEOUT, 10);


