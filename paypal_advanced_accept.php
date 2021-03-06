<?php
// Gateway uses a return url that doesn't allow the action url to have any variables in it so this jump is needed
$class = str_replace('_accept', '', basename(__FILE__, '.php'));
$method = str_replace(($class . '_'), '', basename(__FILE__, '.php'));
$fullclass = basename(__FILE__, '.php');
$host  = $_SERVER['HTTP_HOST'];
$uri   = trim(str_replace(("/" . basename(__FILE__)), '', $_SERVER['SCRIPT_NAME']));
$path  = 'index.php?route=payment/'.$class.'/'.$method;

// Ace/Mijo support
//http://joosite.com/index.php?option=com_mijoshop&route=payment/paypal_advanced/declined
//OpenCart path = /home/www/joosite.com/components/com_mijoshop/opencart
$isAceShop = (strpos($_SERVER['SCRIPT_NAME'], 'aceshop') !== false) ? true : false;
$isMijoShop = (strpos($_SERVER['SCRIPT_NAME'], 'mijoshop') !== false) ? true : false;
if ($isAceShop) {
	$uri = str_replace("components/com_aceshop/opencart", "", $uri);
	$path  = 'index.php?option=com_aceshop&route=payment/'.$class.'/'.$method;
} elseif ($isMijoShop) {
	$uri = str_replace("components/com_mijoshop/opencart", "", $uri);
	$path  = 'index.php?option=com_mijoshop&route=payment/'.$class.'/'.$method;
}
//

$query = "";
if (isset($_REQUEST) && $_REQUEST) {
	$ignore_params = array('PHPSESSID', 'display', 'route', 'language', 'option', 'Itemid', 'mijoshop_store_id', 'currency', '_ga');
	foreach($_REQUEST as $key => $value) {
		if (in_array($key, $ignore_params)) { continue; }
		$query .= '&' . $key . '=' . urlencode($value);
	}
	//file_put_contents($fullclass . '_debug.txt', print_r($_REQUEST, 1));
	$query = rtrim($query, '&');
	echo '<script language="Javascript">parent.location="http://' . $host . $uri . '/' . $path . $query . '"</script>';
} else {
	exit('No parameters found');
}
?>