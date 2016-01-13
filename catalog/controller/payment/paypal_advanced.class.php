<?php
/**
 * @author Qphoria@gmail.com
 * @web http://www.opencartguru.com/
 */

class PPAdvanced {

	public	$test 					= false;

	private $_log;

	public function __construct($logpath = '') {
		if ($logpath && is_dir($logpath) && is_writable($logpath)) { $this->_log = $logpath .  basename(__FILE__, '.php') . '.log'; }
	}

	public function getSecureToken($params = array()) {

		if ($this->test) {
			$url = 'https://pilot-payflowpro.paypal.com';
		} else {
			$url = 'https://payflowpro.paypal.com';
		}

		$str = '';
		foreach ($params as $k => $v) {
			//$str .= "&$k=$v";
			$str .= '&'.$k.'['.strlen($v).']='.$v;
		}
		$str = trim($str, "&");

		$result = $this->curl_post($url, $str);

		$this->writeLog(__FUNCTION__ . "\r\n" . $url . "\r\n" . print_r($params,1) . "\r\n" . print_r($result,1));
		
		if (!$result) { exit(__FUNCTION__ . ' EMPTY CURL RESPONSE'); }

		parse_str($result, $arr);

		if (!isset($arr['RESULT'])) { exit(__FUNCTION__ . ' NO RESULT FLAG'); }
		
		//http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/result_values_for_transaction_declines_or_errors.htm
		if ($arr['RESULT'] != 0) {
			switch ($arr['RESULT']) {
				case '0':
					// success
					break;
				case '1': // User authentication Failed
					$errmsg  = '<h2>Paypal Advanced: USER AUTHENTICATION FAILED!</h2>';
					$errmsg .= '<h3>This means your Paypal Advanced Account is NOT active.</h3>';
					$errmsg .= '<h3>Causes for this:</h3>';
					$errmsg .= '<ul><li>Your Paypal Advanced Account is not fully active. Contact Paypal MTS to have them check it. You can contact them <a href="https://ppmts.custhelp.com/app/ask">HERE</a></li>';
					$errmsg .= '<li>You mistyped your account credentials in the admin area. Double check case and any trailing or leading spaces.</li></ul>';
					$errmsg .= '<h3 style="color:red;">PLEASE <u>DO NOT</u> CONTACT THE DEVELOPER OF THIS EXTENSION.<br/> I HAVE NO CONTROL OVER THIS ISSUE. THIS ERROR COMES DIRECT FROM PAYPAL.</h3>';
					exit($errmsg); 
					break;
				default:
					exit('PAYPAL ADVANCED: '.__FUNCTION__ . ' NON-ZERO RESULT FLAG: ' . print_r($arr,1)); 
			}
		}

		return $arr['SECURETOKEN'];

	}

	public function getIFrame($params = array(), $mode = 'S', $width = '100%', $height = '600', $scrolling = 'no') {

		if ($this->test) {
			$url = 'https://payflowlink.paypal.com';
		} else {
			$url = 'https://payflowlink.paypal.com';
		}

		$secureTokenId = uniqid('', true);
		$params['SECURETOKENID'] = $secureTokenId;
		$secureToken = $this->getSecureToken($params);

		return '<iframe id="ppa_iframe" class="ppa_iframe" name="ppa_iframe" src="'.$url.'?mode='.$mode.'&amp;SECURETOKEN='.$secureToken.'&amp;SECURETOKENID='.$secureTokenId.'" width="'.$width.'" height="'.$height.'" scrolling="'.$scrolling.'" frameborder="0" border="0" allowtransparency="true"></iframe>';

	}
	
	public function getForm($params = array(), $mode = 'S') {

		if ($this->test) {
			$url = 'https://payflowlink.paypal.com';
		} else {
			$url = 'https://payflowlink.paypal.com';
		}

		$secureTokenId = uniqid('', true);
		$params['SECURETOKENID'] = $secureTokenId;
		$secureToken = $this->getSecureToken($params);

		return '
		<form action="'.$url.'" method="post" id="payform">
		<input type="hidden" name="MODE" value="'.$mode.'"/>
		<input type="hidden" name="SECURETOKEN" value="'.$secureToken.'"/>
		<input type="hidden" name="SECURETOKENID" value="'.$secureTokenId.'"/>
		</form>
		';

	}

	private function curl_post($url, $data, $username='', $password='') {
		file_put_contents(DIR_LOGS . 'ppa_curl_debug.txt', "Curl Start....");
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_PORT, 443);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($ch, CURLOPT_TIMEOUT, 35);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 35);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		$response = curl_exec($ch);
		if (curl_error($ch)) { 
			file_put_contents(DIR_LOGS . 'ppa_curl_debug.txt', "Curl Error..." . curl_error($ch), FILE_APPEND);
			exit(curl_error($ch)); 
		}
		file_put_contents(DIR_LOGS . 'ppa_curl_debug.txt', "Curl output..." . print_r($response,1), FILE_APPEND);
		curl_close($ch);
		return $response;
	}

	public function BuildForm($params) {

		if ($this->test) {
			$url = 'https://payflowpro.paypal.com';
		} else {
			$url = 'https://payflowpro.paypal.com';
		}

		$params['dt'] = date('m/d/Y h:i:s A');
		$params['ProductName'] 			= trim($this->_productName, "|");
		$params['ProductQuantity']		= trim($this->_productQuantity, "|");
		$params['ProductPrice'] 		= trim($this->_productPrice, "|");
		$params['ProductID']			= trim($this->_productId, "|");
		$params['ProductDescription']  	= trim($this->_productDescription, "|");

		$data = '<form id="payform" method="post" action="'.$url.'">';
		foreach ($params as $key => $value) {
			$data .= '<input type="hidden" name="'.$key.'" value="'.$value.'" />';
		}
		$data .= '</form>';

		$this->writeLog(__FUNCTION__ . "\r\n" . print_r($data,1));

		return $data;
	}

	private function writeLog($msg) {
		if ($this->_log) {
			$msg = (str_repeat('-', 70) . "\r\n" . $msg . "\r\n" . str_repeat('-', 70) . "\r\n");
			file_put_contents($this->_log, $msg, FILE_APPEND);
		}
	}
}
?>