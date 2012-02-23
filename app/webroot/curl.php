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
//						'cc_number'=>'1234567890123456',
//						'cc_name'=>'Ninad Desai',
//						'cc_exp_date'=>'01/01/2015',
//					),
//					//'w' => array('id' => 1),
//				),
//		);


	$data = array('request' =>
				array (
					'm' => 'read',
					't' => 'credit_details',
					'f' => array(
						'cc_number',
						'cc_name',
						'cc_exp_date',
					),
					'w' => array('id' => 9),
				),
		);


$data_json = serialize($data);

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


