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
  <input type="hidden" name="ui_mode" value="REDIRECT" />
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
/*var emi_months = Array();
<?php foreach($emi_name as $row){ $bank = explode('|', $row); ?>
  var months = Array();
  <?php if(in_array($row, $emi_months_3)){ ?>
    months.push(3);
  <?php } ?>
  <?php if(in_array($row, $emi_months_6)){ ?>
    months.push(6);
  <?php } ?>
  <?php if(in_array($row, $emi_months_9)){ ?>
    months.push(9);
  <?php } ?>
  <?php if(in_array($row, $emi_months_12)){ ?>
    months.push(12);
  <?php } ?>
  months.push('<?php echo $bank[0] ?>');
  emi_months.push(months);
<?php } ?>
var emi_name = $('#emi_name select').val();
for(var i=0;i<emi_months.length;i++){
  if(emi_months[i][emi_months[i].length-1]==emi_name){
    var html = '';
    for(var j=0;j<emi_months[i].length-1;j++){
      html+= '<option value="'+emi_months[i][j]+'">'+emi_months[i][j]+' Months</option>';
    }
    $('#emi_months select').html(html);
    break;
  }
}

$('#emi_name select').change(function(){
  var emi_name = $(this).val();
  for(var i=0;i<emi_months.length;i++){
    if(emi_months[i][emi_months[i].length-1]==emi_name){
      var html = '';
      for(var j=0;j<emi_months[i].length-1;j++){
        html+= '<option value="'+emi_months[i][j]+'">'+emi_months[i][j]+' Months</option>';
      }
      $('#emi_months select').html(html);
      break;
    }
  }
});

$('#payzippy-method').live('click',function(){
  $('#bank_name').css('display','none');
  $('#emi_name').css('display','none');
  $('#emi_months').css('display','none');
});
$('#credit').live('click',function(){
  $('#bank_name').css('display','none');
  $('#emi_name').css('display','none');
  $('#emi_months').css('display','none');
});
$('#debit').live('click',function(){
  $('#bank_name').css('display','none');
  $('#emi_name').css('display','none');
  $('#emi_months').css('display','none');
});
$('#net').live('click',function(){
  $('#bank_name').css('display','block');
  $('#emi_name').css('display','none');
  $('#emi_months').css('display','none');
});
$('#emi').live('click',function(){
  $('#bank_name').css('display','none');
  $('#emi_name').css('display','block');
  $('#emi_months').css('display','block');
});
*/
$('#button-confirm').bind('click', function() {
  $('.attention').remove();
 /* if(!$('#payzippy-method').is(':checked')&&!$('#credit').is(':checked')&&!$('#debit').is(':checked')&&!$('#net').is(':checked')&&!$('#emi').is(':checked')){
    $('#payment').before('<div class="attention"><?php echo $text_attention; ?></div>');
    return;
  }
  if($('#payzippy-method').is(':checked')){
    $('#bank_name').remove();
    $('#emi_name').remove();
    $('#emi_months').remove();
  }
  if($('#credit').is(':checked')){
    $('#bank_name').remove();
    $('#emi_name').remove();
    $('#emi_months').remove();
  }
  if($('#debit').is(':checked')){
    $('#bank_name').remove();
    $('#emi_name').remove();
    $('#emi_months').remove();
  }
  if($('#net').is(':checked')){
    $('#emi_name').remove();
    $('#emi_months').remove();
  }
  if($('#emi').is(':checked')){
    $('#bank_name').remove();
  }
  */
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
