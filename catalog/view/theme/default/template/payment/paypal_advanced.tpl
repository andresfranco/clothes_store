<!--
//-----------------------------------------
// Author: Qphoria@gmail.com
// Web: http://www.OpenCartGuru.com/
//-----------------------------------------
-->
<iframe id="payment_iframe" name="payment_iframe" width="100%" height="1000px" frameBorder="0" style="display:none;"></iframe>
<?php if (version_compare(VERSION, '2.0', '>=')) { // v2.0.x Compatibility ?>

<?php if (isset($error) && $error) { ?>
<div class="alert alert-danger"><?php echo $error; ?></div>
<?php } ?>
<?php if (isset($testmode) && $testmode) { ?>
<div class="alert alert-info"><?php echo $text_testmode; ?></div>
<?php } ?>


<div id="payment"><div id="ppa_wrapper" style="background-color:#FFFFFF;"><?php echo $output; ?></div></div>

<?php if (!$use_iframe) { ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" onclick="$('#payform').submit();" id="button-confirm" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } ?>




<?php } else { // 1.5.x version check ?>


<?php if (isset($error)) { ?>
<div class="warning"><?php echo $error; ?></div>
<?php } ?>
<?php if ($testmode) { ?>
  <div class="warning"><?php echo $this->language->get('text_testmode'); ?></div>
<?php } ?>

<div id="payment"><div id="ppa_wrapper" style="background-color:#FFFFFF;"><?php echo $output; ?></div></div>

<?php if (!$this->config->get($classname . '_iframe')) { ?>
  <div class="buttons">
    <div class="right">
      <!--a onclick="$('#payform').submit();" id="button-confirm" class="button"><span><?php echo $button_continue; ?></span></a-->
	  <input type="button" onclick="$('#payform').submit();" id="button-confirm" class="button" value="<?php echo $button_continue; ?>" />
    </div>
  </div>
<?php } ?>


<?php } // End version check ?>