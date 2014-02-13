<?php
class ControllerPaymentPayzippy extends Controller {
	protected function index() {
		$this->language->load('payment/payzippy');

		$this->data['button_confirm'] = $this->language->get('button_confirm');
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['version'] = $this->language->get('version');
		$this->data['text_wait'] = $this->language->get('text_wait');
		//$this->data['text_payment_method'] = $this->language->get('text_payment_method');
		//$this->data['text_bank_name'] = $this->language->get('text_bank_name');
		//$this->data['text_emi_name'] = $this->language->get('text_emi_name');
		$this->data['text_attention'] = $this->language->get('text_attention');

		$this->data['action'] = 'https://www.payzippy.com/payment/api/charging/v1';

		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		if ($order_info) {			
			$this->data['products'] = array();
			
			foreach ($this->cart->getProducts() as $product) {
				$option_data = array();
	
				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$filename = $this->encryption->decrypt($option['option_value']);
						
						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}
										
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}
				
				$this->data['products'][] = array(
					'name'     => $product['name'],
					'model'    => $product['model'],
					'price'    => $this->currency->format($product['price'], $order_info['currency_code'], false, false),
					'quantity' => $product['quantity'],
					'option'   => $option_data,
					'weight'   => $product['weight']
				);
			}	
			
			
			$total = $this->currency->format($order_info['total'] - $this->cart->getSubTotal(), $order_info['currency_code'], false, false);

			if ($total > 0) {
				$this->data['products'][] = array(
					'name'     => $this->language->get('text_total'),
					'model'    => '',
					'price'    => $total,
					'quantity' => 1,
					'option'   => array(),
					'weight'   => 0
				);	
			} 
			$this->data['total'] = $this->currency->format($order_info['total'], $order_info['currency_code'], false, false)*100;
			$this->data['currency_code'] = $order_info['currency_code'];
			$this->data['email'] = $order_info['email'];
			$this->data['telephone'] = $order_info['telephone'];
			$this->data['first_name'] = html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8');	
			$this->data['last_name'] = html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');	
			$this->data['address'] = html_entity_decode($order_info['payment_address_1'], ENT_QUOTES, 'UTF-8').' '. html_entity_decode($order_info['payment_address_2'], ENT_QUOTES, 'UTF-8');		
			$this->data['city'] = html_entity_decode($order_info['payment_city'], ENT_QUOTES, 'UTF-8');	
			$this->data['state'] = html_entity_decode($order_info['payment_zone'], ENT_QUOTES, 'UTF-8');
			$this->data['zip'] = html_entity_decode($order_info['payment_postcode'], ENT_QUOTES, 'UTF-8');	
			$this->data['country'] = html_entity_decode($order_info['payment_country'], ENT_QUOTES, 'UTF-8');

			/* Customer Shipping Address Fields */
			$this->data['x_ship_to_first_name'] = html_entity_decode($order_info['shipping_firstname'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_last_name'] = html_entity_decode($order_info['shipping_lastname'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_company'] = html_entity_decode($order_info['shipping_company'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_address'] = html_entity_decode($order_info['shipping_address_1'], ENT_QUOTES, 'UTF-8') . ' ' . html_entity_decode($order_info['shipping_address_2'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_city'] = html_entity_decode($order_info['shipping_city'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_state'] = html_entity_decode($order_info['shipping_zone'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_zip'] = html_entity_decode($order_info['shipping_postcode'], ENT_QUOTES, 'UTF-8');
			$this->data['x_ship_to_country'] = html_entity_decode($order_info['shipping_country'], ENT_QUOTES, 'UTF-8');



			$this->data['callback_url'] = $this->url->link('payment/payzippy/callback', 'callback=1', 'SSL');
			$this->data['merchant_id'] = $this->config->get('payzippy_login');
			$this->data['merchant_key_id'] = $this->config->get('payzippy_key');
			/*$this->data['payment_method'] = $this->is_serialized($this->config->get('payzippy_payment_method'))?unserialize($this->config->get('payzippy_payment_method')):array();
			$this->data['bank_name'] = $this->is_serialized($this->config->get('payzippy_bank_name'))?unserialize($this->config->get('payzippy_bank_name')):array();
			$this->data['emi_name'] = $this->is_serialized($this->config->get('payzippy_emi_name'))?unserialize($this->config->get('payzippy_emi_name')):array();
			$this->data['emi_months_3'] = $this->is_serialized($this->config->get('payzippy_emi_months_3'))?unserialize($this->config->get('payzippy_emi_months_3')):array();
			$this->data['emi_months_6'] = $this->is_serialized($this->config->get('payzippy_emi_months_6'))?unserialize($this->config->get('payzippy_emi_months_6')):array();
			$this->data['emi_months_9'] = $this->is_serialized($this->config->get('payzippy_emi_months_9'))?unserialize($this->config->get('payzippy_emi_months_9')):array();
			$this->data['emi_months_12'] = $this->is_serialized($this->config->get('payzippy_emi_months_12'))?unserialize($this->config->get('payzippy_emi_months_12')):array();
			*/$this->data['secret_key'] = $this->config->get('payzippy_secret_key');
			$this->data['udf1'] = $this->config->get('payzippy_udf1');
			$this->data['udf2'] = $this->config->get('payzippy_udf2');
			$this->data['udf3'] = $this->config->get('payzippy_udf3');
			$this->data['udf4'] = $this->config->get('payzippy_udf4');
			$this->data['udf5'] = $this->config->get('payzippy_udf5');
			$this->data['islogged'] = !$this->customer->isLogged()?false:true;
			$this->data['customer_id'] = $this->customer->isLogged(); 
			$_SESSION['time'] = time();
			$this->data['custom'] = $this->session->data['order_id'].$_SESSION['time'];
			$this->data['source'] = 'opencart-' . $this->data['version'];
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payzippy.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/payment/payzippy.tpl';
			} else {
				$this->template = 'default/template/payment/payzippy.tpl';
			}
	
			$this->render();
		}
	}
	
	public function send() {
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		$transaction_amount = '99999999';
		if ($order_info) {			
			$transaction_amount = $this->currency->format($order_info['total'], $order_info['currency_code'], false, false)*100;
		}

		$json = array();
		
		if (isset($_POST['hash'])) {
			$hash_str = '';
		   //if(!empty($_POST['bank_name'])){ 
		   //   $hash_str .= $_POST['bank_name'].'|';
		   //} 
		     $hash_str .= $_POST['billing_address'].'|';
		     $hash_str .= $_POST['billing_city'].'|';
		     $hash_str .= $_POST['billing_country'].'|';
		     $hash_str .= $_POST['billing_name'].'|';
		     $hash_str .= $_POST['billing_state'].'|';
		     $hash_str .= $_POST['billing_zip'].'|';
		     $hash_str .= $_POST['buyer_email_address'].'|';
		     $hash_str .= $_POST['buyer_phone_no'].'|';
		     $hash_str .= $_POST['callback_url'].'|';
		     $hash_str .= $_POST['currency'].'|';
		      //if(!empty($_POST['emi_months'])){ 
		      //$hash_str .= $_POST['emi_months'].'|';
		     //}
		     $hash_str .= 'SHA256|';
		     $hash_str .= $_POST['item_total'].'|';
		     $hash_str .= $_POST['item_vertical'].'|';
		     $hash_str .= $_POST['merchant_id'].'|';
		     $hash_str .= $_POST['merchant_key_id'].'|';
		     $hash_str .= $_POST['merchant_transaction_id'].'|';
		     //$hash_str .= $_POST['payment_method'].'|';
		     $hash_str .= $_POST['shipping_address'].'|';
		     $hash_str .= $_POST['shipping_city'].'|';
		     $hash_str .= $_POST['shipping_country'].'|';
		     $hash_str .= $_POST['shipping_state'].'|';
		     $hash_str .= $_POST['shipping_zip'].'|';
		     $hash_str .= $_POST['source'].'|';
		     $hash_str .= $transaction_amount.'|';
		     $hash_str .= 'SALE|';
		     $hash_str .= $_POST['udf1'].'|';
		     $hash_str .= $_POST['udf2'].'|';
		     $hash_str .= $_POST['udf3'].'|';
		     $hash_str .= $_POST['udf4'].'|';
		     $hash_str .= $_POST['udf5'].'|';
		     $hash_str .= 'REDIRECT|';
		     $hash_str .= $this->config->get('payzippy_secret_key');
		     $hash_str = html_entity_decode($hash_str); 
		    $hash = hash( 'sha256', $hash_str);
			$json['success'] = $hash;
		} else {
			$json['error'] = 'Empty Gateway Response';
		}
				
		$this->response->setOutput(json_encode($json));
	}

	public function callback() {
		if (isset($this->request->get['merchant_transaction_id'])) {
			$order_id = str_replace($_SESSION['time'],'',$this->request->get['merchant_transaction_id']);
		} else {
			$order_id = 0;
		}		

		$this->load->model('checkout/order');
				
		$order_info = $this->model_checkout_order->getOrder($order_id);

		$hash = $this->request->get['hash'];
		$hash_str = '';
		ksort($this->request->get);
		foreach($this->request->get as $key=>$value){
			if($key!='route' && $key!='_route_' && $key!='hash' && $key!='callback') {
				if($value!='null') $hash_str .= $value.'|';
				else $hash_str .= '|';
			}
		}
		$hash_str .= $this->config->get('payzippy_secret_key');
		$check_hash =  hash( 'sha256',$hash_str);

		if ($order_info && $check_hash==$hash) {
			$comment = 'PayZippy Transaction Id:  '.$this->request->get['payzippy_transaction_id'].'<br/>';
			//$comment .= 'Payment Method:  '.$this->request->get['payment_method'].'<br/>';
			//$comment .= 'Bank Name:  '.$this->request->get['bank_name'].'<br/>';
			//if (isset($this->request->get['emi_months'])) {
			//	$comment .= 'Emi Month:  '.$this->request->get['emi_months'].'<br/>';	
			//}
			$comment .= 'Transaction Status:  '.$this->request->get['transaction_status'].'<br/>';
			$comment .= 'Transaction Response Code:  '.$this->request->get['transaction_response_code'].'<br/>';
			$comment .= 'Transaction Response Message:  '.$this->request->get['transaction_response_message'].'<br/>';
			$comment .= 'Is International:  '.$this->request->get['is_international'].'<br/>';
			$comment .= 'Fraud Action:  '.$this->request->get['fraud_action'].'<br/>';

			if($this->request->get['transaction_status']=='SUCCESS'){
				$order_status_id = $this->config->get('payzippy_order_status_id');
				if (!$order_info['order_status_id']) {
					$this->model_checkout_order->confirm($order_id, $order_status_id,$comment,true);
				} else {
					$this->model_checkout_order->update($order_id, $order_status_id,$comment,true);
				}
				$this->redirect($this->url->link('checkout/success'));
			}else{
				$order_status_id = $this->config->get('payzippy_order_status_failed_id');
				if (!$order_info['order_status_id']) {
					$this->model_checkout_order->confirm($order_id, $order_status_id,$comment,true);
				} else {
					$this->model_checkout_order->update($order_id, $order_status_id,$comment,true);
				}
				$this->redirect($this->url->link('payment/payzippy/error','msg='.$_GET['transaction_response_message']));
			}
		} else if($check_hash!=$hash){
			$this->redirect($this->url->link('checkout/checkout', '', 'SSL'));
		} else{
			$this->redirect($this->url->link('payment/payzippy/error','msg='.$_GET['transaction_response_message']));
		}
	}

	public function error() {
		$this->language->load('payment/payzippy');
		
		$this->document->setTitle($this->language->get('error_heading'));
		
		$this->data['breadcrumbs'] = array();
 
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);		
		
		
		$this->data['heading_title'] = $this->language->get('error_heading');
		
		$this->data['text_error'] = $_GET['msg'];
		
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/error.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/error.tpl';
		} else {
			$this->template = 'default/template/payment/error.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
		
		$this->response->setOutput($this->render());
	}

	private function is_serialized($value, &$result = null)
	{
		// Bit of a give away this one
		if (!is_string($value))
		{
			return false;
		}
	 	if (empty($value))
		{
			return false;
		}
		// Serialized false, return true. unserialize() returns false on an
		// invalid string or it could return false if the string is serialized
		// false, eliminate that possibility.
		if ($value === 'b:0;')
		{
			$result = false;
			return true;
		}
	 
		$length	= strlen($value);
		$end	= '';
	 
		switch ($value[0])
		{
			case 's':
				if ($value[$length - 2] !== '"')
				{
					return false;
				}
			case 'b':
			case 'i':
			case 'd':
				// This looks odd but it is quicker than isset()ing
				$end .= ';';
			case 'a':
			case 'O':
				$end .= '}';
	 
				if ($value[1] !== ':')
				{
					return false;
				}
	 
				switch ($value[2])
				{
					case 0:
					case 1:
					case 2:
					case 3:
					case 4:
					case 5:
					case 6:
					case 7:
					case 8:
					case 9:
					break;
	 
					default:
						return false;
				}
			case 'N':
				$end .= ';';
	 
				if ($value[$length - 1] !== $end[0])
				{
					return false;
				}
			break;
	 
			default:
				return false;
		}
	 
		if (($result = @unserialize($value)) === false)
		{
			$result = null;
			return false;
		}
		return true;
	}
}

?>