<?php
// Heading
$_['heading_title']      = 'Paypal Advanced (Q)';

// Text 
$_['text_payment']       = 'Payment';
$_['text_success']       = 'Success: You have modified the account details!';
$_['text_edit']       	 = 'Edit Payment';
$_['text_auth']       	 = 'Auth';
$_['text_sale']       	 = 'Sale';

$_['tab_debug']		   	 = 'Debug';
$_['tab_support']		 = 'Support';

// Entry
$_['entry_title']        = 'Title:';
$_['entry_status']       = 'Status:';
$_['entry_geo_zone']     = 'Geo Zone:';
$_['entry_order_status'] = 'Successful Order Status:';
$_['entry_mid']          = 'User:';
$_['entry_vendor']       = 'Vendor:';
$_['entry_partner']      = 'Partner:';
$_['entry_key']          = 'Password:';
$_['entry_sort_order']   = 'Sort Order:';
$_['entry_mode']   		 = 'Transaction Type:';
$_['entry_total']   	 = 'Min Total:';
$_['entry_tax_class']    = 'Tax Class:';
$_['entry_test']   		 = 'Sandbox Mode:';
$_['entry_debug']   	 = 'Debug Mode:';
$_['entry_debug_file']   = 'Debug File:';
$_['entry_iframe']       = 'Use iFrame:';
$_['entry_itemized']   	 = 'Itemized Paypal Cart:';
$_['entry_max_total']   	 = 'Max Total:';
$_['entry_supported_currencies'] = 'Supported Currencies:';
$_['entry_default_currency'] = 'Default Currency:';
$_['entry_log_to_history'] = 'Log Transaction to history:';

// Tooltip
$_['tooltip_title']        = 'The title shown during the checkout payment step';
$_['tooltip_status']       = 'Enable/Disable';
$_['tooltip_total']	       = 'The minimum total the cart must be to show this payment option. Recommend set to 0.01 or higher.';
$_['tooltip_geo_zone']     = 'Allowed Geo Zone';
$_['tooltip_order_status'] = 'The order status that is set upon successful payment';
$_['tooltip_mid']          = 'If you set up one or more additional users on the account, this value is the ID of the user authorized to process transactions. If, however, you have not set up additional users on the account, USER has the same value as VENDOR';
$_['tooltip_vendor']       = 'The same as your Vendor/Merchant Login name used to login to the paypal manager site';
$_['tooltip_partner']      = 'Usually "PayPal"';
$_['tooltip_key']          = 'The same as your password used to login to the paypal manager site';
$_['tooltip_mode']         = 'Sale - Charge credit card immediately. Auth - Hold funds for 3 days, but do not charge. You have to accept manually from your paypal account.';
$_['tooltip_lang']         = 'The language used on the payment gateway site.';
$_['tooltip_sort_order']   = 'The sort order on the payment checkout step';
$_['tooltip_test']   	   = 'Server mode';
$_['tooltip_tax_class']    = 'Which tax should be applied to the payment';
$_['tooltip_debug']		   = 'Logs messages between store and gateway for troubleshooting to the system/logs folder in FTP.';
$_['tooltip_debug_file']   = '';
$_['tooltip_iframe']   	   = 'Instead of redirect, payment form will open inside of a secure iframe directly on your site, keeping the customer onsite.';
$_['tooltip_max_total']	   = 'The maximum total the cart must be to show this payment option.';
$_['tooltip_supported_currencies'] = 'Choose which currencies are supported by your merchant account. If you are unsure, contact your merchant provider.';
$_['tooltip_default_currency'] = 'If customer uses a disallowed currency from the list above, it will be converted to this currency before sending to the payment gateway.';
$_['tooltip_log_to_history'] = 'Log Paypal Transaction data to the order history. Only viewable by admin. Customer does not see info. Useful for tracking.';

// Help
$_['help_debug'] 		   = '<b style="color:red;">Enable this setting when having issues and send log to Developer when contacting for support. The file is located at "system/logs/'.basename(__FILE__, '.php').'_debug.txt" accessible via FTP. You may also need to send this file to the gateway Tech support.</b>';

// Error
$_['error_fields']       = 'mid,vendor,partner,key'; // Do not edit this line
$_['error_permission']   = 'Warning: You do not have permission to modify this payment module!';
$_['error_mid']  	     = 'Field Required!';
$_['error_vendor'] 	     = 'Field Required!';
$_['error_partner']      = 'Field Required!';
$_['error_key']          = 'Field Required!';
?>