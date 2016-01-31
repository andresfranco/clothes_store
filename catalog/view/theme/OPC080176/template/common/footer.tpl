<footer>


<div class="content_footer_top"><?php echo $footertop; ?> </div>
  <div id="footer" class="container">
     <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3 column">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
		   <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
        </ul>
      </div>
      <?php } ?>
     <?php /*?> <div class="col-sm-3 column">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
             
        </ul>
      </div><?php */?>
      <div class="col-sm-3 column">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
         
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3 column">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        </ul>
      </div>
	<div class="content_footer_right"><?php echo $footerright; ?> </div>

	  
    </div>
	
	<div class="content_footer_bottom"><?php echo $footerbottom; ?> </div>
	
	
	<div class="copyright-container">
 <div id="bottomfooter">
  
  		<ul>
		
    
		<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li> 
    
		<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    
		<li class="login-logout"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
  	
  	</ul>

</div>
<div id="powered"><p><?php echo $powered; ?></p> </div>


</div>
   
    
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>