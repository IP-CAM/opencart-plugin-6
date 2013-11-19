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
            <td><?php echo $entry_payment_method; ?></td>
            <td>
              <input type="checkbox" name="payzippy_payment_method[]" value="CREDIT" id="credit" <?php if(in_array("CREDIT", $payzippy_payment_method)){ ?>checked="checked"<?php } ?> /> <label for="credit">Credit Card</label>
              <input type="checkbox" name="payzippy_payment_method[]" value="DEBIT" id="debit" <?php if(in_array("DEBIT", $payzippy_payment_method)){ ?>checked="checked"<?php } ?> /> <label for="debit">Debit Card</label>
              <input type="checkbox" name="payzippy_payment_method[]" value="EMI" id="emi" <?php if(in_array("EMI", $payzippy_payment_method)){ ?>checked="checked"<?php } ?> /> <label for="emi">Credit Card EMI</label>
              <input type="checkbox" name="payzippy_payment_method[]" value="NET" id="net" <?php if(in_array("NET", $payzippy_payment_method)){ ?>checked="checked"<?php } ?> /> <label for="net">Net Banking</label>
              </td>
          </tr>
           <tr>
            <td><?php echo $entry_bank_name; ?></td>
            <td>
              <select multiple="" size="10" name="payzippy_bank_name[]">
                <option value="">None</option>
                <option <?php if(in_array("ALB|Allahabad Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="ALB|Allahabad Bank">Allahabad Bank</option>
                <option <?php if(in_array("AMEX|American Express", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="AMEX|American Express">American Express</option>
                <option <?php if(in_array("AND|Andhra Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="AND|Andhra Bank">Andhra Bank</option>
                <option <?php if(in_array("AXIS|Axis Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="AXIS|Axis Bank">Axis Bank</option>
                <option <?php if(in_array("BARC|Barclays Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BARC|Barclays Bank">Barclays Bank</option>
                <option <?php if(in_array("BOB|Bank of Baroda", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BOB|Bank of Baroda">Bank of Baroda</option>
                <option <?php if(in_array("BOBAH|Bank of Bahrain and Kuwait", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BOBAH|Bank of Bahrain and Kuwait">Bank of Bahrain and Kuwait</option>
                <option <?php if(in_array("BOI|Bank of India", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BOI|Bank of India">Bank of India</option>
                <option <?php if(in_array("BOM|Bank of Maharashtra", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BOM|Bank of Maharashtra">Bank of Maharashtra</option>
                <option <?php if(in_array("BOP|Bank of Punjab", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BOP|Bank of Punjab">Bank of Punjab</option>
                <option <?php if(in_array("BOR|Bank of Rajasthan", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="BOR|Bank of Rajasthan">Bank of Rajasthan</option>
                <option <?php if(in_array("CBI|Central Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CBI|Central Bank">Central Bank</option>
                <option <?php if(in_array("CBPL|Centurion Bank of Punjab", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CBPL|Centurion Bank of Punjab">Centurion Bank of Punjab</option>
                <option <?php if(in_array("CITIBANK|Citibank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CITIBANK|Citibank">Citibank</option>
                <option <?php if(in_array("CITIUB|City Union Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CITIUB|City Union Bank">City Union Bank</option>
                <option <?php if(in_array("CNB|Canara Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CNB|Canara Bank">Canara Bank</option>
                <option <?php if(in_array("COP|Corporation Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="COP|Corporation Bank">Corporation Bank</option>
                <option <?php if(in_array("COSCB|Cosmos Co-op Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="COSCB|Cosmos Co-op Bank">Cosmos Co-op Bank</option>
                <option <?php if(in_array("CSBL|Catholic Syrian Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CSBL|Catholic Syrian Bank">Catholic Syrian Bank</option>
                <option <?php if(in_array("CUBL|City Union Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="CUBL|City Union Bank">City Union Bank</option>
                <option <?php if(in_array("DBL|Dhanalakshmi Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DBL|Dhanalakshmi Bank">Dhanalakshmi Bank</option>
                <option <?php if(in_array("DBS|DBS Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DBS|DBS Bank">DBS Bank</option>
                <option <?php if(in_array("DCB|Development Credit Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DCB|Development Credit Bank">Development Credit Bank</option>
                <option <?php if(in_array("DCBL|Development Credit Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DCBL|Development Credit Bank">DCBL Bank</option>
                <option <?php if(in_array("DEUNB|Deutsche Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DEUNB|Deutsche Bank">Deutsche Bank</option>
                <option <?php if(in_array("DHNB|Dhanalakshmi Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DHNB|Dhanalakshmi Bank">Dhanalakshmi Bank</option>
                <option <?php if(in_array("DNB|Dena Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DNB|Dena Bank">Dena Bank</option>
                <option <?php if(in_array("DONEC|Done Card", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="DONEC|Done Card">Done Card</option>
                <option <?php if(in_array("FED|Federal Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="FED|Federal Bank">Federal Bank</option>
                <option <?php if(in_array("GE|GE Money", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="GE|GE Money">GE Money</option>
                <option <?php if(in_array("HDFC|HDFC Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="HDFC|HDFC Bank">HDFC Bank</option>
                <option <?php if(in_array("HIB|Himalayan Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="HIB|Himalayan Bank">Himalayan Bank</option>
                <option <?php if(in_array("HSBC|HSBC", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="HSBC|HSBC">HSBC</option>
                <option <?php if(in_array("ICICI|ICICI Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="ICICI|ICICI Bank">ICICI Bank</option>
                <option <?php if(in_array("IDBI|IDBI Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="IDBI|IDBI Bank">IDBI Bank</option>
                <option <?php if(in_array("IIB|IndusInd Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="IIB|IndusInd Bank">IndusInd Bank</option>
                <option <?php if(in_array("INB|Indian Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="IN|Indian Bank">Indian Bank</option>
                <option <?php if(in_array("ING|ING Vysya Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="ING|ING Vysya Bank">ING Vysya Bank</option>
                <option <?php if(in_array("IOB|Indian Overseas Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="IOB|Indian Overseas Bank">Indian Overseas Bank</option>
                <option <?php if(in_array("JKB|J&K Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="JKB|J&K Bank">J&K Bank</option>
                <option <?php if(in_array("JPMC|JPMorgan Chase Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="JPMC|JPMorgan Chase Bank">JPMorgan Chase Bank</option>
                <option <?php if(in_array("KMB|Kotak Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="KMB|Kotak Bank">Kotak Bank</option>
                <option <?php if(in_array("KTKB|Karnataka Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="KTKB|Karnataka Bank">Karnataka Bank</option>
                <option <?php if(in_array("KVB|Karur Vysya Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="KVB|Karur Vysya Bank">Karur Vysya Bank</option>
                <option <?php if(in_array("LVB|Lakshmi Vilas Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="LVB|Lakshmi Vilas Bank">Lakshmi Vilas Bank</option>
                <option <?php if(in_array("NBL|Nabil Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="NBL|Nabil Bank">Nabil Bank</option>
                <option <?php if(in_array("OBC|Oriental Bank of Commerce", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="OBC|Oriental Bank of Commerce">Oriental Bank of Commerce</option>
                <option <?php if(in_array("PMCB|Punjab & Maharashtra Co-op Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="PMCB|Punjab & Maharashtra Co-op Bank">Punjab & Maharashtra Co-op Bank</option>
                <option <?php if(in_array("PNB|Punjab National Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="PNB|Punjab National Bank">Punjab National Bank</option>
                <option <?php if(in_array("RBL|Ratnakar Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="RBL|Ratnakar Bank">Ratnakar Bank</option>
                <option <?php if(in_array("RBS|RBS", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="RBS|RBS">RBS</option>
                <option <?php if(in_array("SACOB|Saraswat Co-op Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SACOB|Saraswat Co-op Bank">Saraswat Co-op Bank</option>
                <option <?php if(in_array("SBH|State Bank of Hyderabad", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SBH|State Bank of Hyderabad">State Bank of Hyderabad</option>
                <option <?php if(in_array("SBI|State Bank of India", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SBI|State Bank of India">State Bank of India</option>
                <option <?php if(in_array("SBM|State Bank of Mysore", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SBM|State Bank of Mysore">State Bank of Mysore</option>
                <option <?php if(in_array("SBT|State Bank of Travancore", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SBT|State Bank of Travancore">State Bank of Travancore</option>
                <option <?php if(in_array("SIB|The South Indian Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SIB|The South Indian Bank">The South Indian Bank</option>
                <option <?php if(in_array("STDC|Standard Chartered Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="STDC|Standard Chartered Bank">Standard Chartered Bank</option>
                <option <?php if(in_array("SVCB|Shamrao Vithal Co-op Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SVCB|Shamrao Vithal Co-op Bank">Shamrao Vithal Co-op Bank</option>
                <option <?php if(in_array("SYNBK|Syndicate Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="SYNBK|Syndicate Bank">Syndicate Bank</option>
                <option <?php if(in_array("TJSB|Thane Janata Sahakari Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="TJSB|Thane Janata Sahakari Bank">Thane Janata Sahakari Bank</option>
                <option <?php if(in_array("TNMB|Tamil Nadu Merchantile Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="TNMB|Tamil Nadu Merchantile Bank">Tamil Nadu Merchantile Bank</option>
                <option <?php if(in_array("UCO|UCO Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="UCO|UCO Bank">UCO Bank</option>
                <option <?php if(in_array("UNI|Union Bank of India", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="UNI|Union Bank of India">Union Bank of India</option>
                <option <?php if(in_array("UNITD|United Bank of India", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="UNITD|United Bank of India">United Bank of India</option>
                <option <?php if(in_array("VJYA|Vijaya Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="VJYA|Vijaya Bank">Vijaya Bank</option>
                <option <?php if(in_array("YES|Yes Bank", $payzippy_bank_name)){ ?>selected="selected"<?php } ?> value="YES|Yes Bank">Yes Bank</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_emi_name; ?></td>
            <td>
              <select multiple="" size="10" name="payzippy_emi_name[]">
                <option value="">None</option>
                <option <?php if(in_array("AMEX|American Express", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="AMEX|American Express">American Express</option>
                <option <?php if(in_array("AXIS|Axis Bank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="AXIS|Axis Bank">Axis Bank</option>
                <option <?php if(in_array("CITIBANK|Citibank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="CITIBANK|Citibank">Citibank</option>
                <option <?php if(in_array("HDFC|HDFC Bank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="HDFC|HDFC Bank">HDFC Bank</option>
                <option <?php if(in_array("HSBC|HSBC", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="HSBC|HSBC">HSBC</option>
                <option <?php if(in_array("ICICI|ICICI Bank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="ICICI|ICICI Bank">ICICI Bank</option>
                <option <?php if(in_array("IIB|IndusInd Bank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="IIB|IndusInd Bank">IndusInd Bank</option>
                <option <?php if(in_array("KMB|Kotak Bank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="KMB|Kotak Bank">Kotak Bank</option>
                <option <?php if(in_array("SBI|State Bank of India", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="SBI|State Bank of India">State Bank of India</option>
                <option <?php if(in_array("STDC|Standard Chartered Bank", $payzippy_emi_name)){ ?>selected="selected"<?php } ?> value="STDC|Standard Chartered Bank">Standard Chartered Bank</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_emi_months_3; ?></td>
            <td>
              <select multiple="" size="10" name="payzippy_emi_months_3[]">
                <option value="">None</option>
                <option <?php if(in_array("AMEX|American Express", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="AMEX|American Express">American Express</option>
                <option <?php if(in_array("AXIS|Axis Bank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="AXIS|Axis Bank">Axis Bank</option>
                <option <?php if(in_array("CITIBANK|Citibank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="CITIBANK|Citibank">Citibank</option>
                <option <?php if(in_array("HDFC|HDFC Bank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="HDFC|HDFC Bank">HDFC Bank</option>
                <option <?php if(in_array("HSBC|HSBC", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="HSBC|HSBC">HSBC</option>
                <option <?php if(in_array("ICICI|ICICI Bank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="ICICI|ICICI Bank">ICICI Bank</option>
                <option <?php if(in_array("IIB|IndusInd Bank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="IIB|IndusInd Bank">IndusInd Bank</option>
                <option <?php if(in_array("KMB|Kotak Bank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="KMB|Kotak Bank">Kotak Bank</option>
                <option <?php if(in_array("SBI|State Bank of India", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="SBI|State Bank of India">State Bank of India</option>
                <option <?php if(in_array("STDC|Standard Chartered Bank", $payzippy_emi_months_3)){ ?>selected="selected"<?php } ?> value="STDC|Standard Chartered Bank">Standard Chartered Bank</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_emi_months_6; ?></td>
            <td>
              <select multiple="" size="10" name="payzippy_emi_months_6[]">
                <option value="">None</option>
                <option <?php if(in_array("AMEX|American Express", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="AMEX|American Express">American Express</option>
                <option <?php if(in_array("AXIS|Axis Bank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="AXIS|Axis Bank">Axis Bank</option>
                <option <?php if(in_array("CITIBANK|Citibank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="CITIBANK|Citibank">Citibank</option>
                <option <?php if(in_array("HDFC|HDFC Bank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="HDFC|HDFC Bank">HDFC Bank</option>
                <option <?php if(in_array("HSBC|HSBC", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="HSBC|HSBC">HSBC</option>
                <option <?php if(in_array("ICICI|ICICI Bank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="ICICI|ICICI Bank">ICICI Bank</option>
                <option <?php if(in_array("IIB|IndusInd Bank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="IIB|IndusInd Bank">IndusInd Bank</option>
                <option <?php if(in_array("KMB|Kotak Bank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="KMB|Kotak Bank">Kotak Bank</option>
                <option <?php if(in_array("SBI|State Bank of India", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="SBI|State Bank of India">State Bank of India</option>
                <option <?php if(in_array("STDC|Standard Chartered Bank", $payzippy_emi_months_6)){ ?>selected="selected"<?php } ?> value="STDC|Standard Chartered Bank">Standard Chartered Bank</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_emi_months_9; ?></td>
            <td>
              <select multiple="" size="10" name="payzippy_emi_months_9[]">
                <option value="">None</option>
                <option <?php if(in_array("AMEX|American Express", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="AMEX|American Express">American Express</option>
                <option <?php if(in_array("AXIS|Axis Bank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="AXIS|Axis Bank">Axis Bank</option>
                <option <?php if(in_array("CITIBANK|Citibank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="CITIBANK|Citibank">Citibank</option>
                <option <?php if(in_array("HDFC|HDFC Bank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="HDFC|HDFC Bank">HDFC Bank</option>
                <option <?php if(in_array("HSBC|HSBC", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="HSBC|HSBC">HSBC</option>
                <option <?php if(in_array("ICICI|ICICI Bank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="ICICI|ICICI Bank">ICICI Bank</option>
                <option <?php if(in_array("IIB|IndusInd Bank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="IIB|IndusInd Bank">IndusInd Bank</option>
                <option <?php if(in_array("KMB|Kotak Bank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="KMB|Kotak Bank">Kotak Bank</option>
                <option <?php if(in_array("SBI|State Bank of India", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="SBI|State Bank of India">State Bank of India</option>
                <option <?php if(in_array("STDC|Standard Chartered Bank", $payzippy_emi_months_9)){ ?>selected="selected"<?php } ?> value="STDC|Standard Chartered Bank">Standard Chartered Bank</option>
              </select>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_emi_months_12; ?></td>
            <td>
              <select multiple="" size="10" name="payzippy_emi_months_12[]">
                <option value="">None</option>
                <option <?php if(in_array("AMEX|American Express", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="AMEX|American Express">American Express</option>
                <option <?php if(in_array("AXIS|Axis Bank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="AXIS|Axis Bank">Axis Bank</option>
                <option <?php if(in_array("CITIBANK|Citibank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="CITIBANK|Citibank">Citibank</option>
                <option <?php if(in_array("HDFC|HDFC Bank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="HDFC|HDFC Bank">HDFC Bank</option>
                <option <?php if(in_array("HSBC|HSBC", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="HSBC|HSBC">HSBC</option>
                <option <?php if(in_array("ICICI|ICICI Bank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="ICICI|ICICI Bank">ICICI Bank</option>
                <option <?php if(in_array("IIB|IndusInd Bank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="IIB|IndusInd Bank">IndusInd Bank</option>
                <option <?php if(in_array("KMB|Kotak Bank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="KMB|Kotak Bank">Kotak Bank</option>
                <option <?php if(in_array("SBI|State Bank of India", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="SBI|State Bank of India">State Bank of India</option>
                <option <?php if(in_array("STDC|Standard Chartered Bank", $payzippy_emi_months_12)){ ?>selected="selected"<?php } ?> value="STDC|Standard Chartered Bank">Standard Chartered Bank</option>
              </select>
            </td>
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