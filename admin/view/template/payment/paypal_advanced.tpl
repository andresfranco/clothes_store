<?php
//-----------------------------------------
// Author: Qphoria@gmail.com
// Web: http://www.OpenCartGuru.com/
//-----------------------------------------
?>
<?php if (version_compare(VERSION, '2.0', '>=')) { // v2.0.x Compatibility ?>
<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-payment-checkout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <div class="container-fluid">
	<?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<?php } ?>
	<?php if (isset($success)) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-extension" class="form-horizontal">

<?php if ($tab_class == 'vtabs') { echo '<div class="col-sm-2">'; } ?>
	      <ul class="nav <?php echo ($tab_class == 'vtabs' ? 'nav nav-pills nav-stacked' : 'nav-tabs') ?>">
<?php foreach ($tabs as $k => $tab) { ?>
	        <li <?php if ($k==0) { echo 'class="active"'; }?>><a href="#<?php echo $tab['id']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a>
<?php } ?>
          </ul>
<?php if ($tab_class == 'vtabs') { echo '</div>'; } ?>

<?php $i=0; ?>

<?php if ($tab_class == 'vtabs') { echo '<div class="col-sm-10">'; } ?>
	      <div class="tab-content">
<?php foreach ($tabs as $k => $tab) { ?>
            <div class="tab-pane<?php if ($k==0) { echo ' active'; }?>" id="<?php echo $tab['id']; ?>">

<?php foreach ($fields as $field) { ?>
<?php if ((empty($field['tab']) && $i == 0) || (!empty($field['tab']) && $field['tab'] == $tab['id'])) { ?>
		      <div class="form-group<?php echo (!empty($field['required']) ) ? ' required' : ''; ?>">
<?php if (!empty($field['entry'])) { ?>
                <label class="col-sm-2 control-label" for="<?php echo $field['name']; ?>"> <?php if(!empty($field['tooltip'])) { ?><span data-toggle="tooltip" title="" data-original-title="<?php echo $field['tooltip']; ?>"?><?php } ?><?php echo $field['entry']; ?><?php if(!empty($field['tooltip'])) { ?></span><?php } ?></label>
<?php } ?>
                <div class="col-sm-10">

<?php if ($field['type'] == 'select') { ?>
			      <select name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" <?php echo (isset($field['multiple']) && $field['multiple']) ? 'multiple="multiple"' : ''?> <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control">
<?php foreach ($field['options'] as $key => $value) : ?>
				    <option value="<?php echo $key; ?>"<?php if((is_array($field['value']) && in_array($key, $field['value'])) || ($field['value'] == $key)) echo ' selected="selected"'?>><?php echo $value; ?></option>
<?php endforeach; ?>
			      </select>
<?php } elseif ($field['type'] == 'radio') {?>
<?php foreach($field['options'] as $key => $value) : ?>
			      <input type="radio" name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" value="<?php echo $key; ?>"<?php if($field['value'] == $key) echo ' checked="checked"'; ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control" /><label for="<?php echo $field['name']; ?>"><?php echo $value; ?></label>
<?php endforeach; ?>
<?php } elseif ($field['type'] == 'text') {?>
			      <input type="text" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" placeholder="<?php echo (!empty($field['placeholder']) ) ? $field['placeholder'] : ''; ?>" id="<?php echo $field['name']; ?>" <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control"/>
<?php } elseif ($field['type'] == 'password') {?>
			      <input type="password" name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control" />
<?php } elseif ($field['type'] == 'checkbox') {?>
			      <input type="checkbox" name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" value="1"<?php if($field['value']) echo 'checked="checked"'; ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control" />
<?php } elseif ($field['type'] == 'file') {?>
			      <input type="file" name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" value="" <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control" />
<?php } elseif ($field['type'] == 'textarea') {?>
			      <textarea name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" cols="<?php echo $field['cols']; ?>" rows="<?php echo $field['rows']; ?>" <?php if (!empty($field['params'])) { echo $field['params']; } ?> class="form-control"><?php echo $field['value']; ?></textarea>
<?php } elseif ($field['type'] == 'hidden') {?>
			      <input type="hidden" id="<?php echo $field['name']; ?>" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" />
<?php } elseif ($field['type'] == 'label') {?>
			      <label id="<?php echo $field['name']; ?>" <?php if (!empty($field['params'])) { echo $field['params']; } ?>><?php echo $field['value']; ?></label>
<?php } elseif ($field['type'] == 'image') {?>
			      <div class="image"<?php if(isset($field['style'])){?> style="<?php echo $field['style']; ?>"<?php } ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>>
				    <img src="<?php echo $field['thumb']; ?>" alt="" id="thumb_<?php echo str_replace(" ", "_", $field['name']); ?>" /><br />
				    <input type="hidden" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" id="image_<?php echo str_replace(" ", "_", $field['name']); ?>" />
				    <a onclick="image_upload('image_<?php echo str_replace(" ", "_", $field['name']); ?>', 'thumb_<?php echo str_replace(" ", "_", $field['name']); ?>');"><?php echo $field['text']; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb_<?php echo str_replace(" ", "_", $field['name']); ?>').attr('src', '<?php echo $field['no_image']; ?>'); $('#image_<?php echo str_replace(" ", "_", $field['name']); ?>').attr('value', '');"><?php echo $text_clear; ?></a>
			      </div>
<?php } elseif ($field['type'] == 'scrollbox') {?>
			      <div class="well well-sm" style="min-height: 150px; overflow: auto;<?php if(isset($field['style'])){?> <?php echo $field['style']; ?><?php } ?>" <?php if (!empty($field['params'])) { echo $field['params']; } ?>>
<?php $class = 'odd'; ?>
<?php foreach ($field['options'] as $key => $value) : ?>
<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
			  	    <div>
				      <input type="checkbox" name="<?php echo $field['name']; ?>" value="<?php echo $key; ?>"<?php if((is_array($field['value']) && in_array($key, $field['value'])) || ($field['value'] == $key)) echo ' checked="checked"'?> />
				      <?php echo $value; ?>
				    </div>
<?php endforeach; ?>
			      </div>
<?php } ?>

<?php if (!empty($field['help'])) { ?>
			      <span class="help-block"><?php echo $field['help']; ?></span><br />
<?php } ?>
<?php if (!empty($field['error'])) { ?>
			      <div class="text-danger"><?php echo $field['error']; ?></div>
<?php } ?>
			    </div>
              </div>
<?php } // end if field tab ?>
<?php } // end foreach fields ?>
	 	    </div>
<?php $i++; ?>
<?php } // end foreach tabs ?>
		  </div>
<?php if ($tab_class == 'vtabs') { echo '</div>'; } ?>
        </form>
      </div>
    </div>
  </div>
</div>

<?php if (!empty($jscript)) { ?>
<script type="text/javascript"><!--
<?php echo $jscript; ?>
//--></script>
<?php } ?>

<?php echo $footer; ?>





<?php } else { // 1.5.x version check ?>
<?php echo $header; ?>
<?php if (isset($breadcrumbs)) { //v15x ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php } ?>
<?php if (!empty($error_warning)) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">

	<?php if (!isset($breadcrumbs)) { //v14x ?>
	<div class="left"></div>
	<div class="right"></div>
	<div class="heading">
		<h1 style="background-image: url('view/image/<?php echo !empty($extension_class) ? $extension_class : 'module' ?>.png');"><?php echo $heading_title; ?></h1>
		<div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
	</div>
	<?php } else { //v15x ?>
	<div class="heading">
      <h1><img src="view/image/<?php echo !empty($extension_class) ? $extension_class : 'module' ?>.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
	<?php } ?>

	<div class="content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<div id="tabs" class="<?php echo !empty($tab_class) ? $tab_class : 'htabs' ?>">
<?php foreach ($tabs as $tab) { ?>
				<a <?php if (isset($breadcrumbs)) {?>href="#<?php echo $tab['id']; ?>"<?php } ?> tab="#<?php echo $tab['id']; ?>"><?php echo $tab['title']; ?></a>
<?php } ?>
			</div>
<?php $i=0; ?>
<?php foreach ($tabs as $tab) { ?>
			<div id="<?php echo $tab['id']; ?>" class="<?php echo !empty($tab_class) ? $tab_class : 'htabs' ?>-content page"">
				<table class="form">
<?php foreach ($fields as $field) { ?>
<?php if ((empty($field['tab']) && $i == 0) || (!empty($field['tab']) && $field['tab'] == $tab['id'])) { ?>
					<tr class="field field-<?php echo $field['type']; ?>">
						<td>
						  <?php echo ((!empty($field['required']) ) ? '<span class="required">*</span>' : '') . $field['entry']; ?>
						  <?php echo ((!empty($field['tooltip']) ) ? '<br/><span class="help">' . $field['tooltip'] . '</span>' : '') ?>
						</td>
						<td>
<?php if ($field['type'] == 'select') { ?>
							<select name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" <?php echo (isset($field['multiple']) && $field['multiple']) ? 'multiple="multiple"' : ''?> <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>>
<?php foreach ($field['options'] as $key => $value) : ?>
								<option value="<?php echo $key; ?>"<?php if((is_array($field['value']) && in_array($key, $field['value'])) || ($field['value'] == $key)) echo ' selected="selected"'?>><?php echo $value; ?></option>
<?php endforeach; ?>
							</select>
<?php } elseif ($field['type'] == 'radio') {?>
<?php foreach($field['options'] as $key => $value) : ?>
							<input type="radio" name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" value="<?php echo $key; ?>"<?php if($field['value'] == $key) echo ' checked="checked"'; ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>/><label for="<?php echo $field['name']; ?>"><?php echo $value; ?></label>
<?php endforeach; ?>
<?php } elseif ($field['type'] == 'text') {?>
							<input type="text" id="<?php echo $field['name']; ?>" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>/>
<?php } elseif ($field['type'] == 'password') {?>
							<input type="password" id="<?php echo $field['name']; ?>" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>/>
<?php } elseif ($field['type'] == 'checkbox') {?>
							<input type="checkbox" id="<?php echo $field['name']; ?>" name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" value="1"<?php if($field['value']) echo 'checked="checked"'; ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>/>
<?php } elseif ($field['type'] == 'file') {?>
							<input type="file" name="<?php echo $field['name']; ?>" value="" <?php echo (isset($field['size']) && $field['size']) ? 'size="' . $field['size'] . '"' : ''?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>/>
<?php } elseif ($field['type'] == 'textarea') {?>
							<textarea name="<?php echo $field['name']; ?>" id="<?php echo $field['name']; ?>" cols="<?php echo $field['cols']; ?>" rows="<?php echo $field['rows']; ?>" <?php if (!empty($field['params'])) { echo $field['params']; } ?>><?php echo $field['value']; ?></textarea>
<?php } elseif ($field['type'] == 'hidden') {?>
							<input type="hidden" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" />
<?php } elseif ($field['type'] == 'label') {?>
							<label id="<?php echo $field['name']; ?>" <?php if (!empty($field['params'])) { echo $field['params']; } ?>><?php echo $field['value']; ?></label>
<?php } elseif ($field['type'] == 'image') {?>
							<div class="image"<?php if(isset($field['style'])){?> style="<?php echo $field['style']; ?>"<?php } ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>>
							<img src="<?php echo $field['thumb']; ?>" alt="" id="thumb_<?php echo str_replace(" ", "_", $field['name']); ?>" /><br />
							<input type="hidden" name="<?php echo $field['name']; ?>" value="<?php echo $field['value']; ?>" id="image_<?php echo str_replace(" ", "_", $field['name']); ?>" />
							<a onclick="image_upload('image_<?php echo str_replace(" ", "_", $field['name']); ?>', 'thumb_<?php echo str_replace(" ", "_", $field['name']); ?>');"><?php echo $field['text']; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb_<?php echo str_replace(" ", "_", $field['name']); ?>').attr('src', '<?php echo $field['no_image']; ?>'); $('#image_<?php echo str_replace(" ", "_", $field['name']); ?>').attr('value', '');"><?php echo $text_clear; ?></a>
							</div>
<?php } elseif ($field['type'] == 'scrollbox') {?>
							<div class="scrollbox"<?php if(isset($field['style'])){?> style="<?php echo $field['style']; ?>"<?php } ?> <?php if (!empty($field['params'])) { echo $field['params']; } ?>>
<?php $class = 'odd'; ?>
<?php foreach ($field['options'] as $key => $value) : ?>
<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
							  <div class="<?php echo $class; ?>">
								<input type="checkbox" name="<?php echo $field['name']; ?>" value="<?php echo $key; ?>"<?php if((is_array($field['value']) && in_array($key, $field['value'])) || ($field['value'] == $key)) echo ' checked="checked"'?> />
							    <?php echo $value; ?>
							  </div>
<?php endforeach; ?>
						    </div>
<?php } ?>
<?php if (!empty($field['help'])) { ?>
							<span class="help"><?php echo $field['help']; ?></span><br />
<?php } ?>
<?php if (!empty($field['error'])) { ?>
							<span class="error"><?php echo $field['error']; ?></span>
<?php } ?>
						</td>
					</tr>
<?php } // end if field tab ?>
<?php } // end foreach fields ?>
				</table>
			</div>
<?php $i++; ?>
<?php } // end foreach tabs ?>
		</form>
	</div>
</div>
<?php if (isset($breadcrumbs)) { //v15x ?></div><?php } ?>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>

<?php if (isset($jscript)) { ?>
<script type="text/javascript"><!--
<?php echo $jscript; ?>
//--></script>
<?php } ?>

<?php echo $footer; ?>



<?php } // End version check ?>