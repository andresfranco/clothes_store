<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
<link href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/stylesheet.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/carousel.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/custom.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/bootstrap.min.css" />

<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/rtl.css">
<?php }?>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!-- Megnor www.templatemela.com - Start -->
<script type="text/javascript" src="catalog/view/javascript/megnor/custom.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/jstree.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/carousel.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/megnor.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/jquery.custom.min.js"></script>
<!-- Megnor www.templatemela.com - End -->

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>


<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>	
</head>

<?php if ($column_left && $column_right) { ?>
<?php $layoutclass = 'layout-3'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php if ($column_left){ ?>
<?php $layoutclass = 'layout-2 left-col'; ?>
<?php } elseif ($column_right) { ?>
<?php $layoutclass = 'layout-2 right-col'; ?>
<?php } ?>
<?php } else { ?>
<?php $layoutclass = 'layout-1'; ?>
<?php } ?>

<body class="<?php echo $class;echo " " ;echo $layoutclass; ?>">
<nav id="top">
	<header id="header">
 	 <div class="container">
	 		
  			<div class="header_right">
				<div class="header_right_top">
  				<div class="col-sm-3"><?php echo $cart; ?></div>
				<?php echo $currency; ?>
	 			 <?php echo $language; ?>
			
				
				<div class="dropdown myaccount tm_headerlinkmenu">
						<div class="tm_headerlinks_inner">
							<div class="headertoggle_img"></div>
						</div>
	 					<ul class="dropdown-menu dropdown-menu-right myaccount-menu">
								<?php if ($logged) { ?>
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
								<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
								<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
								<?php } else { ?>
								<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
								<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
								<?php } ?>
         				 </ul>
							</div>
				</div>
				<div class="header_right_bottom">
				 <div class="col-sm-5"><?php echo $search; ?> </div>
				 </div>
			</div> 
				 
				<div class="header_middel"> 
					
							  <div id="logo">
							  <?php if ($logo) { ?>
							  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
							  <?php } else { ?>
							  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
							  <?php } ?>
							 </div>
					
				</div>
				
				<div class="header_left">	
						<div id="top-links" class="nav pull-right">
						  <ul class="list-inline">
							<li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
							<li class="dropdown myaccount"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
							  <ul class="dropdown-menu dropdown-menu-right myaccount-menu">
								<?php if ($logged) { ?>
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
								<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
								<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
								<?php } else { ?>
								<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
								<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
								<?php } ?>
							  </ul>
							</li>
							<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
							
							<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
						  </ul>
						</div>
						
						<div class="content_headercms_top"><?php echo $headertop; ?> </div>
						
						
				</div>
				
				
				
				
  		</div>
	</header>
</nav>
<nav class="nav-container" role="navigation">
<div class="nav-inner">
<!-- ======= Menu Code START ========= -->
<?php if ($categories) { ?>
<!-- Opencart 3 level Category Menu-->
<div class="container">
<div id="menu" class="main-menu">

<div class="nav-responsive"><span>Menu</span><div class="expandable"></div></div>
  <ul class="main-navigation">
    <li><a>About us</a></li>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
        
        <ul class="dropdown-menu multi-column columns-3">
          <?php if ($category['children']) { ?>
	                   <div class="row">
                        
		               <?php foreach ($category['children'] as $children) { ?>
                         
                         <div class="col-sm-4">
				            <ul class="multi-column-dropdown">
					            <li><a href="<?php echo $children['href']; ?>">
					            <?php echo $children['name']?></a></li>
				            </ul>
			            </div>
		               <?php } ?>
		            </div>
		            <?php } ?>
        </ul>
        <?php } ?>
    </li>

    <?php } ?>
    <li><a>Special Offers</a></li>
    <li><a>Contact us</a></li>
  </ul>
</div>
<!--/.navbar-->
<?php } ?>



<!-- ======= Menu Code END ========= -->
</div>
</div>
</nav>   
<div class="content_top_breadcum">
		<div class="container"> </div>
	</div> 