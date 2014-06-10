<?php 
$item_total = ''; 
$item_vertical = ''; 
foreach ($products as $product) {
  $item_total .= $product['price'].',';
  $item_vertical .= $product['name'].',';
}
$item_total = trim($item_total,',');
$item_vertical = trim($item_vertical,',');
?>


<?php
if (strcasecmp($ui_mode, "iframe") == 0) {
   $charging_url = 'https://www.payzippy.com/payment/api/charging/v1?';
   $hash_str = '';
   $hash_str .= $address.'|'; $hash_str .= $city.'|'; $hash_str .= $country.'|'; $hash_str .= $first_name.' '.$last_name.'|';
   $hash_str .= $state.'|'; $hash_str .= $zip.'|'; $hash_str .= $email.'|'; $hash_str .= $telephone.'|';
   $hash_str .= $callback_url.'|'; $hash_str .= $currency_code.'|'; $hash_str .= 'SHA256|'; $hash_str .= $item_total.'|'; $hash_str .= $item_vertical.'|';
   $hash_str .= $merchant_id.'|'; $hash_str .= $merchant_key_id.'|'; $hash_str .= $custom.'|'; $hash_str .= 'PAYZIPPY|';

   $hash_str .= $x_ship_to_address.'|'; $hash_str .= $x_ship_to_city.'|'; $hash_str .= $x_ship_to_country.'|'; $hash_str .= $x_ship_to_state.'|';
   $hash_str .= $x_ship_to_zip.'|'; $hash_str .= $source.'|'; $hash_str .= $total.'|'; 
   $hash_str .= 'SALE|'; $hash_str .= $udf1.'|'; $hash_str .= $udf2.'|'; $hash_str .= $udf3.'|'; $hash_str .= $udf4.'|'; $hash_str .= $udf5.'|';
   $hash_str .= $ui_mode.'|'; $hash_str .= $this->config->get('payzippy_secret_key');
   $hash_str = html_entity_decode($hash_str); 
   $hash = hash( 'sha256', $hash_str);

   $charging_url1='';

   $callback_url = urlencode($callback_url);
   $callback_url = str_replace("%26amp%3B", "%26", $callback_url);

   $charging_url1 .= 'currency='.$currency_code.'&billing_address='.$address.'&billing_city='.$city.'&billing_country='.$country.'&billing_name='.$first_name.' '.$last_name;
   $charging_url1 .= '&billing_state='.$state.'&billing_zip='.$zip.'&buyer_email_address='.$email.'&buyer_phone_no='.$telephone;
   $charging_url1 .= '&callback_url='.$callback_url.'&hash_method='.'SHA256'.'&payment_method='.'PAYZIPPY';
   $charging_url1 .= '&item_total='.$item_total.'&item_vertical='.$item_vertical.'&merchant_id='.$merchant_id.'&merchant_key_id='.$merchant_key_id;
   $charging_url1 .= '&merchant_transaction_id='.$custom.'&shipping_address='.$x_ship_to_address.'&shipping_city='.$x_ship_to_city.'&shipping_country='.$x_ship_to_country;
   $charging_url1 .= '&shipping_state='.$x_ship_to_state.'&shipping_zip='.$x_ship_to_zip.'&transaction_amount='.$total.'&transaction_type=SALE';
   $charging_url1 .= '&source='.$source.'&udf1='.$udf1.'&udf2='.$udf2.'&udf3='.$udf3.'&udf4='.$udf4.'&udf5='.$udf5.'&ui_mode='.$ui_mode.'&hash='.$hash;
   $charging_url1 = html_entity_decode($charging_url1);

   $charging_url .= $charging_url1;
?>


<center>
<div class="checkout-product">
<table>
<tr><td>
<iframe src="<?php echo $charging_url; ?>" frameborder="0" height="590" width="100%"></iframe>
</td></tr>
</table>
</center>
</div>

<?php
}else{
?>

<h2><?php echo $text_title; ?></h2>
  <div class="content" id="payment">
      <form action="<?php echo $action; ?>" method="post" id="payzippy-form">
        <input type="hidden" name="billing_address" value="<?php echo $address; ?>" />
        <input type="hidden" name="billing_city" value="<?php echo $city; ?>" />
        <input type="hidden" name="billing_country" value="<?php echo $country; ?>" />
        <input type="hidden" name="billing_name" value="<?php echo $first_name.' '.$last_name; ?>" />
        <input type="hidden" name="billing_state" value="<?php echo $state; ?>" />
        <input type="hidden" name="billing_zip" value="<?php echo $zip; ?>" />
        <input type="hidden" name="buyer_email_address" value="<?php echo $email; ?>" />
        <input type="hidden" name="buyer_phone_no" value="<?php echo $telephone; ?>" />
        <input type="hidden" name="callback_url" value="<?php echo $callback_url; ?>" />
        <input type="hidden" name="currency" value="<?php echo $currency_code; ?>" />
        <input type="hidden" name="hash_method" value="SHA256" />  
        <input type="hidden" name="item_total" value="<?php echo $item_total; ?>" />
        <input type="hidden" name="item_vertical" value="<?php echo $item_vertical; ?>" />
        <input type="hidden" name="merchant_id" value="<?php echo $merchant_id; ?>" />
        <input type="hidden" name="merchant_key_id" value="<?php echo $merchant_key_id; ?>" />
        <input type="hidden" name="merchant_transaction_id" value="<?php echo $custom; ?>" />
        <!-- Removed php code that was sending bank name, emi... --> 
        <input type="hidden" name="shipping_address" value="<?php echo $x_ship_to_address; ?>" />
        <input type="hidden" name="shipping_city" value="<?php echo $x_ship_to_city; ?>" />
        <input type="hidden" name="shipping_country" value="<?php echo $x_ship_to_country; ?>" />
        <input type="hidden" name="shipping_state" value="<?php echo $x_ship_to_state; ?>" />
        <input type="hidden" name="shipping_zip" value="<?php echo $x_ship_to_zip; ?>" />
        <input type="hidden" name="transaction_amount" value="<?php echo $total; ?>" />
        <input type="hidden" name="transaction_type" value="SALE" />
        <input type="hidden" name="source" value="<?php echo $source; ?>" />
        <input type="hidden" name="udf1" value="<?php echo $udf1; ?>" />
        <input type="hidden" name="udf2" value="<?php echo $udf2; ?>" />
        <input type="hidden" name="udf3" value="<?php echo $udf3; ?>" />
        <input type="hidden" name="udf4" value="<?php echo $udf4; ?>" />
        <input type="hidden" name="udf5" value="<?php echo $udf5; ?>" />
        <input type="hidden" name="ui_mode" value="<?php echo $ui_mode; ?>" />
        <input type="hidden" name="hash" value="" />

        <div class="buttons">
          <div class="right">
            <input id="button-confirm" type="button" value="<?php echo $button_confirm; ?>" class="button" />
            <input type="submit" value="submit" style="display:none;" />
          </div>
        </div>
      </form>
</div>



<script type="text/javascript">

$('#button-confirm').bind('click', function() {
  $('.attention').remove();
 
  $.ajax({
    url: 'index.php?route=payment/payzippy/send',
    type: 'post',
    data: $("#payzippy-form").serialize(),
    dataType: 'json',   
    beforeSend: function() {
      $('#button-confirm').attr('disabled', true);
      $('#payment').before('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
    },
    complete: function() {
      $('#button-confirm').attr('disabled', false);
      $('.attention').remove();
    },        
    success: function(json) {
      if (json['error']) {
        alert(json['error']);
      }
      
      if (json['success']) {
        $('#payment input[name=hash]').val(json['success']);
        $('#payment input[type=submit]').click();
      }
    }
  });
});
</script>
<?php
}
?>


