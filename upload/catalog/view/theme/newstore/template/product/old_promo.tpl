<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-md-6 col-sm-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9 col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>

      <?php if ($products) { ?>
      <div class="product-filter">
      <div class="row">
        <div class="col-sm-7 col-xs-12">
        
        <div class="display">
          <div class="sortoptions"> 
           <button type="button" id="grid-view" class="btn btn-default active" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="icon-grid icons"></i></button>    
           <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="icon-list icons"></i></button>     
          </div>
        </div>
        <div  class="product-compare-categ"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div> 
        </div>
        
        <div class="col-sm-3 col-xs-8 sort">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-2 col-xs-4 limit">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      
      </div>
      </div>
       <?php if ($column_left && $column_right) { ?>
    <?php $class2 = 'product-layout product-grid col-lg-4 col-md-6 col-sm-6 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class2 = 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class2 = 'product-layout product-grid col-lg-25 col-md-3 col-sm-4 col-xs-12'; ?>
    <?php } ?>
    
     <?php if (isset($show_rating) && ($show_rating))  { $heighbox = 'heighbox'; } else {  $heighbox = ''; } ?>
      <div class="row grid-barb <?php echo $heighbox; ?>">
        <?php foreach ($products as $product) { ?>
        <div class="<?php echo $class2; ?>">
        <div class="product-thumb ">
            <div class="image-stick"> 

                <?php if (isset($product['saving']) && $product['special'] ) { ?> 
             <div class="savemoney">-<?php echo $product['saving']; ?>%</div> 
             <?php } ?> 
             <div class="image">   
             <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>">      
          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"  title="<?php echo $product['name']; ?>"/>
          </a><?php } ?>

              </div>
           
            </div>

              <div class="caption">
              
                 <div class="caption-right">
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
                
                 <?php if (isset($show_rating) && ($show_rating))  { ?>
                  <div class="rating"> 
                  <?php if (isset($product['reviews']) && ($product['reviews'] > 0)) { ?> <b>(<?php echo $product['reviews']; ?>)</b>  <?php } ?>
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>   
                  </div>
                  <?php } ?>
                  
                   <div class="wish-comp">
                <button type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="barb-wishlist">
                <i class="icon-heart icons"></i> <?php echo $button_wishlist; ?></button>
                <button type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="barb-compare">
                <i class="icon-chart icons"></i> <?php echo $button_compare; ?></button>
                </div>
                
                  
                  </div>
                 
                <a href="<?php echo $product['href']; ?>"><h4><?php echo $product['name']; ?></h4></a>
                 <div class="button-group">
               <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span><?php echo $button_cart; ?></span></button>
               </div>
              
              <div class="caption-details option-content"> 

             <div class="wish-comp">
                <button type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="barb-wishlist">
                <i class="icon-heart icons"></i> <?php echo $button_wishlist; ?></button>
                <button type="button"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');" class="barb-compare">
                <i class="icon-chart icons"></i> <?php echo $button_compare; ?></button>
                </div> 
     
    
          
          <?php if (strlen($product['description']) > 11) { ?> <div class="descr"><?php echo $product['description']; ?></div> <?php } ?>
         
                     
              </div>
              
              
            </div>
          </div>
        </div>
        <?php } ?>
      </div>

      <div class="row barbara-pagination">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
 
<?php echo $footer; ?>