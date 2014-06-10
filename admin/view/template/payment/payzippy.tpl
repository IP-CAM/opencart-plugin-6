<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_login; ?></td>
            <td><input type="text" name="payzippy_login" value="<?php echo $payzippy_login; ?>" />
              <?php if ($error_login) { ?>
              <span class="error"><?php echo $error_login; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_key; ?></td>
            <td><input type="text" name="payzippy_key" value="<?php echo $payzippy_key; ?>" />
              <?php if ($error_key) { ?>
              <span class="error"><?php echo $error_key; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_secret_key; ?></td>
            <td><input type="text" name="payzippy_secret_key" value="<?php echo $payzippy_secret_key; ?>" />
              <?php if ($error_secret_key) { ?>
              <span class="error"><?php echo $error_secret_key; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $ui_mode; ?></td>
            <td>
              <!--<input type="text" name="payzippy_ui_mode" value="<?php echo $payzippy_ui_mode; ?>" />-->
              <select name="payzippy_ui_mode">
              <option value="REDIRECT"
              <?php
              if($payzippy_ui_mode == "REDIRECT"){
              ?>
              selected
              <?php
              }
              ?>
              >REDIRECT</option>
              <option value="IFRAME"
              <?php
              if($payzippy_ui_mode == "IFRAME"){
              ?>
              selected
              <?php
              }
              ?>
              >IFRAME</option>
              </select>
              <?php if ($error_ui_mode) { ?>
              <span class="error"><?php echo $error_ui_mode; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_udf1; ?></td>
            <td><input type="text" name="payzippy_udf1" value="<?php echo $payzippy_udf1; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_udf2; ?></td>
            <td><input type="text" name="payzippy_udf2" value="<?php echo $payzippy_udf2; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_udf3; ?></td>
            <td><input type="text" name="payzippy_udf3" value="<?php echo $payzippy_udf3; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_udf4; ?></td>
            <td><input type="text" name="payzippy_udf4" value="<?php echo $payzippy_udf4; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_udf5; ?></td>
            <td><input type="text" name="payzippy_udf5" value="<?php echo $payzippy_udf5; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_total; ?></td>
            <td><input type="text" name="payzippy_total" value="<?php echo $payzippy_total; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_order_status; ?></td>
            <td><select name="payzippy_order_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $payzippy_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_order_status_failed; ?></td>
            <td><select name="payzippy_order_status_failed_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $payzippy_order_status_failed_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="payzippy_status">
                <?php if ($payzippy_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="payzippy_sort_order" value="<?php echo $payzippy_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
