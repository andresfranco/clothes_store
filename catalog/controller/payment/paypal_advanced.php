<?php

class ControllerPaymentPaypalAdvanced extends Controller {

	protected $errors = array();

	public function index() {

		# Generic Init
		$extension_type 			= 'payment';
		$classname 					= str_replace('vq2-' . basename(DIR_APPLICATION) . '_' . strtolower(get_parent_class($this)) . '_' . $extension_type . '_', '', basename(__FILE__, '.php'));
		$data['classname'] 			= $classname;
		$data 						= array_merge($data, $this->load->language($extension_type . '/' . $classname));
		$data['testmode'] 			= $this->config->get($classname . '_test');

		# Form Fields
		$data['fields'] = array();
		$data['fields']['hidden'] = array();

		# Order Info
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		# Error Check
		$data['error'] = (isset($this->session->data['error'])) ? $this->session->data['error'] : NULL;
		unset($this->session->data['error']);

		$data['use_iframe'] = $this->config->get($classname . '_iframe');

		# Check for supported currency, otherwise convert to ISK.
		$supported_currencies = explode(",", $this->config->get($classname . '_supported_currencies'));
		if (in_array($order_info['currency_code'], $supported_currencies)) {
			$currency = $order_info['currency_code'];
		} else {
			$currency = $this->config->get($classname . '_default_currency');
		}

		$amount = str_replace(array(''), '', $this->currency->format($order_info['total'], $currency, FALSE, FALSE));
		$accepturl 		= $this->url->link($extension_type . '/' . $classname . '/accept', '', 'SSL');
		$declineurl 	= $this->url->link($extension_type . '/' . $classname . '/decline', '', 'SSL');
		$cancelurl 		= $this->url->link($extension_type . '/' . $classname . '/cancel', '', 'SSL');
		$successurl 	= $this->url->link($extension_type . '/' . $classname . '/success', '', 'SSL');
		$callbackurl 	= $this->url->link($extension_type . '/' . $classname . '/callback', '', 'SSL');

		// Mijo Support
		if (strpos(DIR_SYSTEM, 'mijo') !== false) {
			$accepturl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $accepturl);
			$declineurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $declineurl);
			$cancelurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $cancelurl);
			$successurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $successurl);
			$callbackurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $callbackurl);
		}

		$storename = ($this->config->get('config_name')) ? $this->config->get('config_name') : $this->config->get('config_store');
		$store_url = ($this->config->get('config_ssl') ? (is_numeric($this->config->get('config_ssl'))) ? str_replace('http', 'https', $this->config->get('config_url')) : $this->config->get('config_ssl') : $this->config->get('config_url'));

		require_once(DIR_SYSTEM . '../catalog/controller/payment/paypal_advanced.class.php');
 		if ($this->config->get($classname . '_debug')) {
 			$payclass = New PPAdvanced(DIR_LOGS);
		} else {
			$payclass = New PPAdvanced();
		}

		$mode = 'LIVE';
		if ($this->config->get($classname . '_test')) {
			$payclass->test = true;
			$mode = 'TEST';
		}

		# Prepare Data to send
		$params = array(
 			'USER' 				=> trim($this->config->get($classname . '_mid')),
 			'VENDOR' 			=> trim($this->config->get($classname . '_vendor')),
			'PARTNER'			=> trim($this->config->get($classname . '_partner')),
			'PWD' 				=> trim($this->config->get($classname . '_key')),
			'CREATESECURETOKEN'	=> 'Y',
			'TRXTYPE'			=> $this->config->get($classname . '_mode'),
			'AMT'				=> $amount,
				'CURRENCY'			=> $currency,
			'COMPANYNAME'		=> trim(html_entity_decode($order_info['payment_company'], ENT_QUOTES, 'UTF-8')),
			'BILLTOFIRSTNAME'	=> trim(html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8')),
			'BILLTOLASTNAME'	=> trim(html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8')),
			'BILLTOSTREET'		=> trim(html_entity_decode($order_info['payment_address_1'] . ' ' . $order_info['payment_address_2'], ENT_QUOTES, 'UTF-8')),
			'BILLTOCITY'		=> trim(html_entity_decode($order_info['payment_city'], ENT_QUOTES, 'UTF-8')),
			'BILLTOSTATE'		=> trim($order_info['payment_zone_code']),
			'BILLTOZIP'			=> trim($order_info['payment_postcode']),
			'BILLTOCOUNTRY'		=> trim($order_info['payment_iso_code_2']),
				//'CUSTIP'			=> trim($order_info['ip']),
				'CUSTOM'			=> ('ORDID-' . $order_info['order_id']),
			'EMAIL'				=> $order_info['email'],
			'PHONENUM'			=> $order_info['telephone'],
			'INVNUM'			=> ('INV' . $order_info['order_id']), // Paypal apparently requires this to start with a letter so I strip it later
			'RETURNURL' 		=> ($store_url . $classname.'_accept.php'),
			'ERRORURL' 			=> ($store_url . $classname.'_declined.php'),
			'CANCELURL' 		=> ($store_url . $classname.'_cancel.php'),
			'NOTIFYURL' 		=> ($store_url . $classname.'_callback.php')
 		);

		// This oddly has to be set BEFORE the shipping address info below. I don't understand why.
		if ($this->cart->hasShipping()) {
			$params['ADDROVERRIDE'] = 1;
		}

		##### ITEMIZED TOTALS. 1.5.0 or LATER ######
		// Paypal Advanced only allows 10 line items.
		// So I have to check the total count of totals AND products before deciding if I can display line-items
		$dbtotals = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total where order_id = '" . $this->session->data['order_id'] . "' ORDER BY sort_order ASC");
		//echo count($this->cart->getProducts());
		//echo count($dbtotals);
		$ppItemCount = (int)(count($this->cart->getProducts()) + max(count($dbtotals)-5, 0));
		//echo $ppItemCount;
		if (!method_exists($this->document, 'addBreadcrumb') && $this->config->get($classname . '_itemized') && ($ppItemCount <= 10)) { //1.5.x
 			$itemAmt = 0;
 			$i = 0;

			### Itemized Products
			foreach ($this->cart->getProducts() as $product) {
				$description = $product['name'];
				if ($product['option']) {
					$values = array();
 					foreach ($product['option'] as $option) {
						if (isset($option['option_value'])) {
							$values[] = $option['name'].':'.$option['option_value'];
						} elseif (isset($option['value'])) {
							$values[] = $option['name'].':'.$option['value'];
						}
					}
					if ($values) {
						$description = implode(', ', $values);
					} else {
						$description = '';
					}
				}
				$params["L_NAME$i"] = (substr(html_entity_decode($product['name'], ENT_QUOTES, "ISO-8859-1"), 0, 30));
				$params["L_SKU$i"] 	= $product['model'];
				$params["L_DESC$i"] = (substr(html_entity_decode($description, ENT_QUOTES, "ISO-8859-1"), 0, 110) . '...');
				$params["L_QTY$i"] 	= $product['quantity'];
				$params["L_COST$i"] = $this->currency->format(($product['price'] * $product['quantity']), $currency, FALSE, FALSE);
				$itemAmt += $params["L_COST$i"];
				$i++;
			}

			### Itemized Totals
			//$dbtotals = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total where order_id = '" . $this->session->data['order_id'] . "' ORDER BY sort_order ASC");
			$params["DISCOUNT"] = (float)'0.00';
			$params['SHIPPINGAMT'] = (float)'0.00';
			$params['TAXAMT'] = (float)'0.00';
			foreach ($dbtotals->rows as $dbtotal) {
				if (!$dbtotal['value']) { continue; }
				if ($dbtotal['code'] == 'sub_total' || $dbtotal['code'] == 'total' || $dbtotal['code'] == 'handling') { continue; }
				$cost = $this->currency->format(($dbtotal['value']), $currency, FALSE, FALSE);
				if ($dbtotal['code'] == 'shipping') {
					// Add handling to shipping since HANDLINGAMT doesn't work in paypal for some reason
					foreach ($dbtotals->rows as $dbtotal2) {
						if ($dbtotal2['code'] != 'handling') { continue; }
						$cost += $this->currency->format(($dbtotal2['value']), $currency, FALSE, FALSE);
					}
					if (!$cost) { continue; } // skip if free shipping
					$params['SHIPPINGAMT'] = number_format($cost, 2, '.', '');
					continue;
				}
				if ($dbtotal['code'] == 'tax') {
					$params['TAXAMT'] = number_format($cost, 2, '.', '');
					continue;
				}
				$params["L_NAME$i"] = (substr(html_entity_decode(str_replace(array('-','_'), ' ', ucwords($dbtotal['code'])), ENT_QUOTES, "ISO-8859-1"), 0, 30));
				$params["L_SKU$i"] 	= isset($dbtotal['code']) ? $dbtotal['code'] : str_replace(' ', '-', strtolower($dbtotal['title']));
				$params["L_DESC$i"] = (substr(html_entity_decode($dbtotal['title'], ENT_QUOTES, "ISO-8859-1"), 0, 110));
				$params["L_QTY$i"] 	= 1;
				$params["L_COST$i"] = $cost;

				// If discount, add to the DISCOUNT field
				//if ($params["L_COST$i"] < 1) {
					//$params["DISCOUNT"] += $this->currency->format(abs($cost), $currency, FALSE, FALSE);
				//} else {
					//$itemAmt += (float)$params["L_COST$i"];
				//}
				$i++;
			}

			$params['ITEMAMT'] = number_format($itemAmt, 2, '.', ''); // ensure that is has 2 decimal precision because paypal is sensitive
			//$params['SHIPPINGAMT'] = number_format(($amount-$itemAmt), 2, '.', ''); // ensure that is has 2 decimal precision because paypal is sensitive

			$calc_total = ($params['ITEMAMT'] - $params["DISCOUNT"] + $params['SHIPPINGAMT'] + $params['TAXAMT']);
			if ($params['AMT'] != $calc_total) {
				file_put_contents(DIR_LOGS . "paypal_advanced_amt_exception.txt", "INVNUM " . $params['INVNUM'] . "\r\n" . "AMT= " . $params['AMT'] . "\r\n" . "Item/Disc/Ship= " . $calc_total, FILE_APPEND);
				$params['AMT'] = $calc_total;
			}

		}

		// Gift Voucher
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$params["DISCOUNT"] += $voucher['amount'];
			}
		}

		if (!empty($params["DISCOUNT"])) {
			$params["DISCOUNT"] = number_format($params["DISCOUNT"], 2, '.', '');
		} else {
			unset($params["DISCOUNT"]);
		}
		##########################################


		if ($this->cart->hasShipping()) {
			$params['SHIPTOFIRSTNAME']	= trim(html_entity_decode($order_info['shipping_firstname'], ENT_QUOTES, 'UTF-8'));
			$params['SHIPTOLASTNAME']	= trim(html_entity_decode($order_info['shipping_lastname'], ENT_QUOTES, 'UTF-8'));
			$params['SHIPTOSTREET']		= trim(html_entity_decode($order_info['shipping_address_1'] . ' ' . $order_info['shipping_address_2'], ENT_QUOTES, 'UTF-8'));
			$params['SHIPTOCITY']		= trim(html_entity_decode($order_info['shipping_city'], ENT_QUOTES, 'UTF-8'));
			$params['SHIPTOSTATE']		= trim($order_info['shipping_zone_code']);
			$params['SHIPTOZIP']		= trim($order_info['shipping_postcode']);
			$params['SHIPTOCOUNTRY']	= trim($order_info['shipping_iso_code_2']);
		} else {
			$params['NOSHIPPING']		= '1';
		}

		if ($this->config->get($classname . '_iframe')) {
			$data['output'] = $payclass->getIFrame($params, $mode, '100%', '600', 'no');
		} else {
			$data['output'] = $payclass->getForm($params, $mode);
		}

		# Compatibility
		if (version_compare(VERSION, '2.0', '>=')) { // v2.0.x Compatibility
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $extension_type . '/'. $classname . '.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/' . $extension_type . '/'. $classname . '.tpl', $data);
			} else {
				return $this->load->view('default/template/' . $extension_type . '/'. $classname . '.tpl', $data);
			}
		} elseif (version_compare(VERSION, '2.0', '<')) {  // 1.5.x Backwards Compatibility
			$this->data = array_merge($this->data, $data);
			$this->id 	= 'payment';
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/' . $classname . '.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/payment/' . $classname . '.tpl';
			} else {
				$this->template = 'default/template/payment/' . $classname . '.tpl';
			}
        	$this->render();
		}
	}

	public function declined() {

		$classname = str_replace('vq2-catalog_controller_payment_', '', basename(__FILE__, '.php'));
		$store_url = ($this->config->get('config_ssl') ? (is_numeric($this->config->get('config_ssl'))) ? str_replace('http', 'https', $this->config->get('config_url')) : $this->config->get('config_ssl') : $this->config->get('config_url'));
		$this->load->language('payment/' . $classname);

		// Debug
		if ($this->config->get($classname . '_debug')) { file_put_contents(DIR_LOGS . $classname . '_' . __FUNCTION__ . '_debug.txt', 'GET: ' . print_r($_GET,1) . "\r\n" . 'POST: ' . print_r($_POST,1) . "\r\n"); }

		// Paypal bug. They send Held for Review to the Decline path instead of Approved
		if ($_REQUEST['RESULT'] == '126') {
			$this->callback();
			exit;
		}

		if (!empty($_REQUEST['RESPMSG'])) {
			$this->session->data['error'] = urldecode($_REQUEST['RESPMSG']);
		} else {
			$this->session->data['error'] = $this->language->get('error_declined');
		}

/*
		if ($this->config->get($classname . '_log_to_history') && isset($_REQUEST['INVNUM'])) {
			$msg = print_r($_REQUEST,1);
			$order_id = str_replace('INV', '', $_REQUEST['INVNUM']);
			$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '1', notify = '0', comment = '" . $this->db->escape($msg) . "', date_added = NOW()");
		}
*/
		$this->fail();

	}

	public function accept() {
		$classname = str_replace('vq2-catalog_controller_payment_', '', basename(__FILE__, '.php'));
		$successurl = $this->url->link('checkout/success', '', 'SSL');
		// Mijo Support
		if (strpos(DIR_SYSTEM, 'mijo') !== false) { $successurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $successurl); }

		// Debug
		if ($this->config->get($classname . '_debug')) { file_put_contents(DIR_LOGS . $classname . '_' . __FUNCTION__ . '_debug.txt', 'GET: ' . print_r($_GET,1) . "\r\n" . 'POST: ' . print_r($_POST,1) . "\r\n"); }

		$this->callback();

		//echo '<script language="text/javascript">parent.location="'. $successurl . '"</script>';
		$this->response->redirect(str_replace("&amp;", "&", $successurl));
	}

	public function xaccept() {
		$classname = str_replace('vq2-catalog_controller_payment_', '', basename(__FILE__, '.php'));
		$successurl = $this->url->link('checkout/success', '', 'SSL');
		// Mijo Support
		if (strpos(DIR_SYSTEM, 'mijo') !== false) { $successurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $successurl); }

		// Debug
		if ($this->config->get($classname . '_debug')) { file_put_contents(DIR_LOGS . $classname . '_' . __FUNCTION__ . '_debug.txt', 'GET: ' . print_r($_GET,1) . "\r\n" . 'POST: ' . print_r($_POST,1) . "\r\n"); }

		$this->callback();

		//echo '<script language="text/javascript">parent.location="'. $successurl . '"</script>';
		$this->response->redirect(str_replace("&amp;", "&", $successurl));
	}

	public function cancel() {
		$classname = str_replace('vq2-catalog_controller_payment_', '', basename(__FILE__, '.php'));
		$cancelurl = $this->url->link('checkout/cart', '', 'SSL');

		// Mijo Support
		if (strpos(DIR_SYSTEM, 'mijo') !== false) { $cancelurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $cancelurl);}

		// Debug
		if ($this->config->get($classname . '_debug')) { file_put_contents(DIR_LOGS . $classname . '_' . __FUNCTION__ . '_debug.txt', 'GET: ' . print_r($_GET,1) . "\r\n" . 'POST: ' . print_r($_POST,1) . "\r\n"); }

		//echo '<script language="text/javascript">parent.location="'. $cancelurl . '"</script>';
		$this->response->redirect(str_replace("&amp;", "&", $cancelurl));
	}

	private function fail($msg = false) {
		$failurl = $this->url->link('checkout/cart');
		// Mijo Support
		if (strpos(DIR_SYSTEM, 'mijo') !== false) { $failurl = str_replace('route', 'option=com_mijoshop&format=raw&tmpl=component&route', $failurl); }
		if (!$msg) { $msg = (!empty($this->session->data['error']) ? $this->session->data['error'] : 'Unknown Error'); }
		echo '<html><head><script type="text/javascript">';
		echo 'alert("'.addslashes($msg).'");';
		echo 'window.location="' . $failurl . '";';
		echo '</script></head></html>';
		exit;
	}

	public function callback() {
		# Generic Init
		$extension_type 			= 'payment';
		$classname 					= str_replace('vq2-' . basename(DIR_APPLICATION) . '_' . strtolower(get_parent_class($this)) . '_' . $extension_type . '_', '', basename(__FILE__, '.php'));
		$data['classname'] 			= $classname;
		$data 						= array_merge($data, $this->load->language($extension_type . '/' . $classname));

		// Debug
		if ($this->config->get($classname . '_debug')) { file_put_contents(DIR_LOGS . $classname . '_debug.txt', __FUNCTION__ . "\r\n$classname GET: " . print_r($_GET,1) . "\r\n" . "$classname POST: " . print_r($_POST,1) . "\r\n", FILE_APPEND); }

		if (isset($_REQUEST['INVOICE'])) {
			$order_id = str_replace('INV', '', $_REQUEST['INVOICE']);
		} else {
			$order_id = 0;
		}

	  	$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);

		// If there is no order info then fail.
		if (!$order_info) {
			$this->session->data['error'] = $this->language->get('error_no_order');
			$this->fail();
		}

		if (!isset($_REQUEST['RESULT'])) {
			if (!empty($_REQUEST['RESPMSG'])) {
				$this->session->data['error'] = $_REQUEST['RESPMSG'];
			} else {
				$this->session->data['error'] = $this->language->get('error_invalid');
			}
			$this->fail();
		}

		$msg = '';

		if (isset($_REQUEST['RESULT'])) {
			switch($_REQUEST['RESULT']) {
				case "0":
					if ($this->config->get($classname . '_log_to_history')) { $msg = print_r($_REQUEST,1); }
					if (method_exists($this->model_checkout_order, 'addOrderHistory')) { // v20x
						$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'), $order_info['comment'], true);
						$this->model_checkout_order->addOrderHistory($order_id, $this->config->get($classname . '_order_status_id'), $msg, false);
					} else { //v15x
						$this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'), $order_info['comment']);
						$this->model_checkout_order->update($order_id, $this->config->get($classname . '_order_status_id'), $msg, FALSE);
					}
					break;
				case "126":
					$msg = $_REQUEST['RESPMSG'];
					if (method_exists($this->model_checkout_order, 'addOrderHistory')) { // v20x
						$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'), $order_info['comment'], true);
						$this->model_checkout_order->addOrderHistory($order_id, $this->config->get('config_order_status_id'), $msg, false);
					} else { //v15x
						$this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'), $order_info['comment']);
						$this->model_checkout_order->update($order_id, $this->config->get('config_order_status_id'), $msg, FALSE);
					}
					break;
				default:
					if ($this->config->get($classname . '_log_to_history')) {
						$msg = print_r($_REQUEST,1);
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_history SET order_id = '" . (int)$order_id . "', order_status_id = '1', notify = '0', comment = '" . $this->db->escape($msg) . "', date_added = NOW()");
					}
					if (!empty($_REQUEST['RESPMSG'])) {
						$this->session->data['error'] = $_REQUEST['RESPMSG'];
					} else {
						$this->session->data['error'] = $this->language->get('error_declined');
					}
					$this->fail();
			}
		} else {
			$this->session->data['error'] = $this->language->get('error_invalid');
			$this->fail();
		}
	}
}
?>