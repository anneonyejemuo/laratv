<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Paypal extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		// Load helpers
		$this->load->helper('url');
		// Load session library
		$this->load->library('session');
		// Load PayPal library config
		$this->config->load('paypal');
		$config = array(
			'Sandbox' => $this->config->item('paypalMode'), 				// Sandbox / testing mode option.
			'APIUsername' => $this->config->item('paypalApiUsername'), 		// PayPal API username of the API caller
			'APIPassword' => $this->config->item('paypalApiPassword'), 		// PayPal API password of the API caller
			'APISignature' => $this->config->item('paypalApiSignature'),	// PayPal API signature of the API caller
			'APISubject' => '',												// PayPal API subject (email address of 3rd party user that has granted API permission for your app)
			'APIVersion' => '123.0',        								// API version you'd like to use for your call.  You can set a default version in the class and leave this blank if you want.
			'DeveloperEmailAccount' => $this->config->item('DeveloperEmailAccount')
		);
		// Show Errors
		if ($this->config->item('paypalMode')) {
			error_reporting(E_ALL);
			ini_set('display_errors', '1');
		}
		// Load PayPal library
		$this->load->library('paypal/paypal_pro', $config);
	}

	/**
	 * Cart Review page
	 */
	function index()
	{
		
	}

	/**
	 * SetExpressCheckout
	 */
	function SetExpressCheckout()
	{
		// Clear PayPalResult from session userdata
		$this->session->unset_userdata('PayPalResult');

		// Get cart data from session userdata
		$cart = $this->session->userdata('shopping_cart');

		/**
		 * Here we are setting up the parameters for a basic Express Checkout flow.
		 *
		 * The template provided at /vendor/angelleye/paypal-php-library/templates/SetExpressCheckout.php
		 * contains a lot more parameters that we aren't using here, so I've removed them to keep this clean.
		 *
		 * $domain used here is set in the config file.
		 */
		$SECFields = array(
			'maxamt' => round($cart['shopping_cart']['grand_total'] * 2,2), 	// The expected maximum total amount the order will be, including S&H and sales tax.
			'returnurl' => site_url('paypal/GetExpressCheckoutDetails'), 	// Required.  URL to which the customer will be returned after returning from PayPal.  2048 char max.
			'cancelurl' => site_url('paypal/OrderCancelled'), 	// Required.  URL to which the customer will be returned if they cancel payment on PayPal's site.
			'logoimg' => $this->config->item('paypalImage'), 	// A URL to your logo image.  Formats:  .gif, .jpg, .png.  190x60.  PayPal places your logo image at the top of the cart review area.  This logo needs to be stored on a https:// server.
			'brandname' => 'Linda Ikeji Tv',	// A label that overrides the business name in the PayPal account on the PayPal hosted checkout pages.  127 char max.
			'customerservicenumber' => '816-555-5555',	// Merchant Customer Service number displayed on the PayPal Review page. 16 char max.
		);

		/**
		 * Now we begin setting up our payment(s).
		 *
		 * Express Checkout includes the ability to setup parallel payments,
		 * so we have to populate our $Payments array here accordingly.
		 *
		 * For this sample (and in most use cases) we only need a single payment,
		 * but we still have to populate $Payments with a single $Payment array.
		 *
		 * Once again, the template file includes a lot more available parameters,
		 * but for this basic sample we've removed everything that we're not using,
		 * so all we have is an amount.
		 */
		$Payments = array();
		$Payment = array(
			'amt' => $cart['shopping_cart']['grand_total'], 	// Required.  The total cost of the transaction to the customer.  If shipping cost and tax charges are known, include them in this value.  If not, this value should be the current sub-total of the order.
		);

		/**
		 * Here we push our single $Payment into our $Payments array.
		 */
		array_push($Payments, $Payment);

		/**
		 * Now we gather all of the arrays above into a single array.
		 */
		$PayPalRequestData = array(
			'SECFields' => $SECFields,
			'Payments' => $Payments,
		);

		/**
		 * Here we are making the call to the SetExpressCheckout function in the library,
		 * and we're passing in our $PayPalRequestData that we just set above.
		 */
		$PayPalResult = $this->paypal_pro->SetExpressCheckout($PayPalRequestData);

		/**
		 * Now we'll check for any errors returned by PayPal, and if we get an error,
		 * we'll save the error details to a session and redirect the user to an
		 * error page to display it accordingly.
		 *
		 * If all goes well, we save our token in a session variable so that it's
		 * readily available for us later, and then redirect the user to PayPal
		 * using the REDIRECTURL returned by the SetExpressCheckout() function.
		 */
		if(!$this->paypal_pro->APICallSuccessful($PayPalResult['ACK']))
		{
			$errors = array('Errors'=>$PayPalResult['ERRORS']);

			$this->session->set_userdata('errors', $errors);

			if ($this->config->item('paypalMode')) {
				// Load errors to variable
				$this->load->vars('errors', $errors);
				$this->load->view('responseAjax');
			} else {
				redirect(site_url('user/subscription/'.$this->session->userdata('url')), 'Location');
			}
			
		}
		else
		{
			// Successful call.

			// Set PayPalResult into session userdata (so we can grab data from it later on a 'payment complete' page)
			$this->session->set_userdata('PayPalResult', $PayPalResult);

			// In most cases you would automatically redirect to the returned 'RedirectURL' by using: redirect($PayPalResult['REDIRECTURL'],'Location');
			// Move to PayPal checkout
			redirect($PayPalResult['REDIRECTURL'], 'Location');
		}
	}

	/**
	 * GetExpressCheckoutDetails (optional: create view to review cart before chekcout)
	 */
	function GetExpressCheckoutDetails()
	{
		// Get cart data from session userdata
		$cart = $this->session->userdata('shopping_cart');

		// Get PayPal data from session userdata
		$SetExpressCheckoutPayPalResult = $this->session->userdata('PayPalResult');
		$PayPal_Token = $SetExpressCheckoutPayPalResult['TOKEN'];

		/**
		 * Now we pass the PayPal token that we saved to a session variable
		 * in the SetExpressCheckout.php file into the GetExpressCheckoutDetails
		 * request.
		 */
		$PayPalResult = $this->paypal_pro->GetExpressCheckoutDetails($PayPal_Token);

		/**
		 * Now we'll check for any errors returned by PayPal, and if we get an error,
		 * we'll save the error details to a session and redirect the user to an
		 * error page to display it accordingly.
		 *
		 * If the call is successful, we'll save some data we might want to use
		 * later into session variables.
		 */
		if(!$this->paypal_pro->APICallSuccessful($PayPalResult['ACK']))
		{
			$errors = array('Errors'=>$PayPalResult['ERRORS']);

			$this->session->set_userdata('errors', $errors);

			if ($this->config->item('paypalMode')) {
				// Load errors to variable
				$this->load->vars('errors', $errors);
				$this->load->view('responseAjax');
			} else {
				redirect(site_url('user/subscription/'.$this->session->userdata('url')), 'Location');
			}
		}
		else
		{
			// Successful call.

			/**
			 * Here we'll pull out data from the PayPal response.
			 * Refer to the PayPal API Reference for all of the variables available
			 * in $PayPalResult['variablename']
			 *
			 * https://developer.paypal.com/docs/classic/api/merchant/GetExpressCheckoutDetails_API_Operation_NVP/
			 *
			 * Again, Express Checkout allows for parallel payments, so what we're doing here
			 * is usually the library to parse out the individual payments using the GetPayments()
			 * method so that we can easily access the data.
			 *
			 * We only have a single payment here, which will be the case with most checkouts,
			 * but we will still loop through the $Payments array returned by the library
			 * to grab our data accordingly.
			 */
			$cart['paypal_payer_id'] = isset($PayPalResult['PAYERID']) ? $PayPalResult['PAYERID'] : '';
			$cart['phone_number'] = isset($PayPalResult['PHONENUM']) ? $PayPalResult['PHONENUM'] : '';
			$cart['email'] = isset($PayPalResult['EMAIL']) ? $PayPalResult['EMAIL'] : '';
			$cart['first_name'] = isset($PayPalResult['FIRSTNAME']) ? $PayPalResult['FIRSTNAME'] : '';
			$cart['last_name'] = isset($PayPalResult['LASTNAME']) ? $PayPalResult['LASTNAME'] : '';

			foreach($PayPalResult['PAYMENTS'] as $payment) {
				$cart['shipping_name'] = isset($payment['SHIPTONAME']) ? $payment['SHIPTONAME'] : '';
				$cart['shipping_street'] = isset($payment['SHIPTOSTREET']) ? $payment['SHIPTOSTREET'] : '';
				$cart['shipping_city'] = isset($payment['SHIPTOCITY']) ? $payment['SHIPTOCITY'] : '';
				$cart['shipping_state'] = isset($payment['SHIPTOSTATE']) ? $payment['SHIPTOSTATE'] : '';
				$cart['shipping_zip'] = isset($payment['SHIPTOZIP']) ? $payment['SHIPTOZIP'] : '';
				$cart['shipping_country_code'] = isset($payment['SHIPTOCOUNTRYCODE']) ? $payment['SHIPTOCOUNTRYCODE'] : '';
				$cart['shipping_country_name'] = isset($payment['SHIPTOCOUNTRYNAME']) ? $payment['SHIPTOCOUNTRYNAME'] : '';
			}

			/**
			 * At this point, we now have the buyer's shipping address available in our app.
			 * We could now run the data through a shipping calculator to retrieve rate
			 * information for this particular order.
			 *
			 * This would also be the time to calculate any sales tax you may need to
			 * add to the order, as well as handling fees.
			 *
			 * We're going to set static values for these things in our static
			 * shopping cart, and then re-calculate our grand total.
			 */
			$cart['shopping_cart']['shipping'] = 10.00;
			$cart['shopping_cart']['handling'] = 2.50;
			$cart['shopping_cart']['tax'] = 1.50;

			$cart['shopping_cart']['grand_total'] = number_format(
				$cart['shopping_cart']['subtotal']
				+ $cart['shopping_cart']['shipping']
				+ $cart['shopping_cart']['handling']
				+ $cart['shopping_cart']['tax'],2);

			/**
			 * Now we will redirect the user to a final review
			 * page so they can see the shipping/handling/tax
			 * that has been added to the order.
			 */
			// Set example cart data into session
			$this->session->set_userdata('shopping_cart', $cart);

			// Load example cart data to variable
			// $this->load->vars('cart', $cart);

			// Example - Load Review Page
			// $this->load->view('paypal/demos/express_checkout/review', $cart);

			redirect(site_url('paypal/DoExpressCheckoutPayment'), 'Location');
		}
	}

	/**
	 * DoExpressCheckoutPayment
	 */
	function DoExpressCheckoutPayment()
	{
		/**
		 * Now we'll setup the request params for the final call in the Express Checkout flow.
		 * This is very similar to SetExpressCheckout except that now we can include values
		 * for the shipping, handling, and tax amounts, as well as the buyer's name and
		 * shipping address that we obtained in the GetExpressCheckoutDetails step.
		 *
		 * If this information is not included in this final call, it will not be
		 * available in PayPal's transaction details data.
		 *
		 * Once again, the template for DoExpressCheckoutPayment provides
		 * many more params that are available, but we've stripped everything
		 * we are not using in this basic demo out.
		 */

		// Get cart data from session userdata
		$cart = $this->session->userdata('shopping_cart');

		// Get cart data from session userdata
		$SetExpressCheckoutPayPalResult = $this->session->userdata('PayPalResult');
		$PayPal_Token = $SetExpressCheckoutPayPalResult['TOKEN'];

		$DECPFields = array(
			'token' => $PayPal_Token, 								// Required.  A timestamped token, the value of which was returned by a previous SetExpressCheckout call.
			'payerid' => $cart['paypal_payer_id'], 							// Required.  Unique PayPal customer id of the payer.  Returned by GetExpressCheckoutDetails, or if you used SKIPDETAILS it's returned in the URL back to your RETURNURL.
		);

		/**
		 * Just like with SetExpressCheckout, we need to gather our $Payment
		 * data to pass into our $Payments array.  This time we can include
		 * the shipping, handling, tax, and shipping address details that we
		 * now have.
		 */
		$Payments = array();
		$Payment = array(
			'amt' => number_format($cart['shopping_cart']['grand_total'],2), 	    // Required.  The total cost of the transaction to the customer.  If shipping cost and tax charges are known, include them in this value.  If not, this value should be the current sub-total of the order.
			'itemamt' => number_format($cart['shopping_cart']['subtotal'],2),       // Subtotal of items only.
			'currencycode' => 'USD', 					                                // A three-character currency code.  Default is USD.
			'shippingamt' => number_format($cart['shopping_cart']['shipping'],2), 	// Total shipping costs for this order.  If you specify SHIPPINGAMT you mut also specify a value for ITEMAMT.
			'handlingamt' => number_format($cart['shopping_cart']['handling'],2), 	// Total handling costs for this order.  If you specify HANDLINGAMT you mut also specify a value for ITEMAMT.
			'taxamt' => number_format($cart['shopping_cart']['tax'],2), 			// Required if you specify itemized L_TAXAMT fields.  Sum of all tax items in this order.
			'shiptoname' => $cart['shipping_name'], 					            // Required if shipping is included.  Person's name associated with this address.  32 char max.
			'shiptostreet' => $cart['shipping_street'], 					        // Required if shipping is included.  First street address.  100 char max.
			'shiptocity' => $cart['shipping_city'], 					            // Required if shipping is included.  Name of city.  40 char max.
			'shiptostate' => $cart['shipping_state'], 					            // Required if shipping is included.  Name of state or province.  40 char max.
			'shiptozip' => $cart['shipping_zip'], 						            // Required if shipping is included.  Postal code of shipping address.  20 char max.
			'shiptocountrycode' => $cart['shipping_country_code'], 				    // Required if shipping is included.  Country code of shipping address.  2 char max.
			'shiptophonenum' => $cart['phone_number'],  				            // Phone number for shipping address.  20 char max.
			'paymentaction' => 'Sale', 					                                // How you want to obtain the payment.  When implementing parallel payments, this field is required and must be set to Order.
		);

		/**
		 * Here we push our single $Payment into our $Payments array.
		 */
		array_push($Payments, $Payment);

		/**
		 * Now we gather all of the arrays above into a single array.
		 */
		$PayPalRequestData = array(
			'DECPFields' => $DECPFields,
			'Payments' => $Payments,
		);

		/**
		 * Here we are making the call to the DoExpressCheckoutPayment function in the library,
		 * and we're passing in our $PayPalRequestData that we just set above.
		 */
		$PayPalResult = $this->paypal_pro->DoExpressCheckoutPayment($PayPalRequestData);

		/**
		 * Now we'll check for any errors returned by PayPal, and if we get an error,
		 * we'll save the error details to a session and redirect the user to an
		 * error page to display it accordingly.
		 *
		 * If the call is successful, we'll save some data we might want to use
		 * later into session variables, and then redirect to our final
		 * thank you / receipt page.
		 */
		if(!$this->paypal_pro->APICallSuccessful($PayPalResult['ACK']))
		{
			$errors = array('Errors'=>$PayPalResult['ERRORS']);

			$this->session->set_userdata('errors', $errors);

			if ($this->config->item('paypalMode')) {
				// Load errors to variable
				$this->load->vars('errors', $errors);
				$this->load->view('responseAjax');
			} else {
				redirect(site_url('user/subscription/'.$this->session->userdata('url')), 'Location');
			}
		}
		else
		{
			// Successful call.
			/**
			 * Once again, since Express Checkout allows for multiple payments in a single transaction,
			 * the DoExpressCheckoutPayment response is setup to provide data for each potential payment.
			 * As such, we need to loop through all the payment info in the response.
			 *
			 * The library helps us do this using the GetExpressCheckoutPaymentInfo() method.  We'll
			 * load our $payments_info using that method, and then loop through the results to pull
			 * out our details for the transaction.
			 *
			 * Again, in this case we are you only working with a single payment, but we'll still
			 * loop through the results accordingly.
			 *
			 * Here, we're only pulling out the PayPal transaction ID and fee amount, but you may
			 * refer to the API reference for all the additional parameters you have available at
			 * this point.
			 *
			 * https://developer.paypal.com/docs/classic/api/merchant/DoExpressCheckoutPayment_API_Operation_NVP/
			 */
			foreach($PayPalResult['PAYMENTS'] as $payment)
			{
				$cart['paypal_transaction_id'] = isset($payment['TRANSACTIONID']) ? $payment['TRANSACTIONID'] : '';
				$cart['paypal_transaction_type'] = isset($payment['TRANSACTIONTYPE']) ? $payment['TRANSACTIONTYPE'] : '';
				$cart['paypal_fee'] = isset($payment['FEEAMT']) ? $payment['FEEAMT'] : '';
			}

			$cart['paypal_ack'] = isset($PayPalResult['ACK']) ? $PayPalResult['ACK'] : '';

			// Set example cart data into session
			$this->session->set_userdata('shopping_cart', $cart);

			// Successful Order
			redirect('paypal/PaymentComplete');
		}
	}

	/**
	 * Make a payment by credit card with PayPal Pro
	 *
	 * @return void
	 */
	function doDirectPayment()
	{
		// Get cart data from session userdata
		$cart = $this->session->userdata('shopping_cart');



		$DPFields = array(
							'paymentaction' => 'Sale', 						// How you want to obtain payment.  Authorization indidicates the payment is a basic auth subject to settlement with Auth & Capture.  Sale indicates that this is a final sale for which you are requesting payment.  Default is Sale.
							'ipaddress' => $_SERVER['REMOTE_ADDR'], 							// Required.  IP address of the payer's browser.
							'returnfmfdetails' => '1' 					// Flag to determine whether you want the results returned by FMF.  1 or 0.  Default is 0.
						);
						
		$CCDetails = array(
							'creditcardtype' => 'Visa', 					// Required. Type of credit card.  Visa, MasterCard, Discover, Amex, Maestro, Solo.  If Maestro or Solo, the currency code must be GBP.  In addition, either start date or issue number must be specified.
							'acct' => $cart['card_number'], 								// Required.  Credit card number.  No spaces or punctuation.  
							'expdate' => $cart['card_expiration'], 							// Required.  Credit card expiration date.  Format is MMYYYY
							'cvv2' => $cart['card_cvv'], 								// Requirements determined by your PayPal account settings.  Security digits for credit card.
							'startdate' => '', 							// Month and year that Maestro or Solo card was issued.  MMYYYY
							'issuenumber' => ''							// Issue number of Maestro or Solo card.  Two numeric digits max.
						);
						
		$PayerInfo = array(
							'email' => $cart['buyer_email'], 								// Email address of payer.
							'payerid' => '', 							// Unique PayPal customer ID for payer.
							'payerstatus' => '', 						// Status of payer.  Values are verified or unverified
							'business' => '' 							// Payer's business name.
						);
						
		$PayerName = array(
							'salutation' => '', 						// Payer's salutation.  20 char max.
							'firstname' => $this->session->userdata('username'), 							// Payer's first name.  25 char max.
							'middlename' => '', 						// Payer's middle name.  25 char max.
							'lastname' => '', 							// Payer's last name.  25 char max.
							'suffix' => ''								// Payer's suffix.  12 char max.
						);
						
		$BillingAddress = array(
								'street' => '', 						// Required.  First street address.
								'street2' => '', 						// Second street address.
								'city' => '', 							// Required.  Name of City.
								'state' => '', 							// Required. Name of State or Province.
								'countrycode' => '', 					// Required.  Country code.
								'zip' => '', 							// Required.  Postal code of payer.
								'phonenum' => '' 						// Phone Number of payer.  20 char max.
							);
							
		$ShippingAddress = array(
								'shiptoname' => '', 					// Required if shipping is included.  Person's name associated with this address.  32 char max.
								'shiptostreet' => '', 					// Required if shipping is included.  First street address.  100 char max.
								'shiptostreet2' => '', 					// Second street address.  100 char max.
								'shiptocity' => '', 					// Required if shipping is included.  Name of city.  40 char max.
								'shiptostate' => '', 					// Required if shipping is included.  Name of state or province.  40 char max.
								'shiptozip' => '', 						// Required if shipping is included.  Postal code of shipping address.  20 char max.
								'shiptocountry' => '', 					// Required if shipping is included.  Country code of shipping address.  2 char max.
								'shiptophonenum' => ''					// Phone number for shipping address.  20 char max.
								);
							
		$PaymentDetails = array(
								'amt' => $cart['price'], 							// Required.  Total amount of order, including shipping, handling, and tax.  
								'currencycode' => 'USD', 					// Required.  Three-letter currency code.  Default is USD.
								'itemamt' => '', 						// Required if you include itemized cart details. (L_AMTn, etc.)  Subtotal of items not including S&H, or tax.
								'shippingamt' => '', 					// Total shipping costs for the order.  If you specify shippingamt, you must also specify itemamt.
								'shipdiscamt' => '', 					// Shipping discount for the order, specified as a negative number.  
								'handlingamt' => '', 					// Total handling costs for the order.  If you specify handlingamt, you must also specify itemamt.
								'taxamt' => '', 						// Required if you specify itemized cart tax details. Sum of tax for all items on the order.  Total sales tax. 
								'desc' => 'Web Order', 							// Description of the order the customer is purchasing.  127 char max.
								'custom' => '', 						// Free-form field for your own use.  256 char max.
								'invnum' => '', 						// Your own invoice or tracking number
								'notifyurl' => ''						// URL for receiving Instant Payment Notifications.  This overrides what your profile is set to use.
							);	
				
		$OrderItems = array();
		$Item	 = array(
							'l_name' => '', 						// Item Name.  127 char max.
							'l_desc' => '', 						// Item description.  127 char max.
							'l_amt' => $cart['price'], 							// Cost of individual item.
							'l_number' => '', 						// Item Number.  127 char max.
							'l_qty' => '1', 							// Item quantity.  Must be any positive integer.  
							'l_taxamt' => '', 						// Item's sales tax amount.
							'l_ebayitemnumber' => '', 				// eBay auction number of item.
							'l_ebayitemauctiontxnid' => '', 		// eBay transaction ID of purchased item.
							'l_ebayitemorderid' => '' 				// eBay order ID for the item.
					);
		array_push($OrderItems, $Item);
		
		$Secure3D = array(
						  'authstatus3d' => '', 
						  'mpivendor3ds' => '', 
						  'cavv' => '', 
						  'eci3ds' => '', 
						  'xid' => ''
						  );
						  
		$PayPalRequestData = array(
								'DPFields' => $DPFields, 
								'CCDetails' => $CCDetails, 
								'PayerInfo' => $PayerInfo, 
								'PayerName' => $PayerName, 
								'BillingAddress' => $BillingAddress, 
								'ShippingAddress' => $ShippingAddress, 
								'PaymentDetails' => $PaymentDetails, 
								'OrderItems' => $OrderItems, 
								'Secure3D' => $Secure3D
							);
							
		$PayPalResult = $this->paypal_pro->DoDirectPayment($PayPalRequestData);
		
		if(!$this->paypal_pro->APICallSuccessful($PayPalResult['ACK']))
		{
			$errors = array('Errors'=>$PayPalResult['ERRORS']);

			$this->session->set_userdata('errors', $errors);

			if ($this->config->item('paypalMode')) {
				// Load errors to variable
				$this->load->vars('errors', $errors);
				$this->load->view('responseAjax');
			} else {
				redirect(site_url('user/subscription/'.$this->session->userdata('url')), 'Location');
			}
		}
		else
		{
			// Successful call.
			$cart['paypal_transaction'] = array('PayPalResult'=>$PayPalResult);
			$cart['paypal_payer_id'] = $PayPalResult['TRANSACTIONID'];
			$cart['shopping_cart']['grand_total'] = $PayPalResult['AMT'];
			$cart['paypal_ack'] = $PayPalResult['ACK'];
			$cart['paypal_transaction_id'] = $PayPalResult['TRANSACTIONID'];
			// Set example cart data into session
			$this->session->set_userdata('shopping_cart', $cart);
			// Successful Order
			redirect('paypal/PaymentComplete');

		}
	}

	/**
	 * Create recurring payment with Paypal Pro
	 *
	 * @return void
	 */
	function createRecurringPaymentsProfile()
	{
		// Get cart data from session userdata
		$cart = $this->session->userdata('shopping_cart');

		$DaysTimestamp = strtotime('now');
		$Mo = date('m', $DaysTimestamp);
		$Day = date('d', $DaysTimestamp);
		$Year = date('Y', $DaysTimestamp);
		$StartDateGMT = $Year . '-' . $Mo . '-' . $Day . 'T00:00:00\Z';

		$CRPPFields = array(
					'token' => '', 								// Token returned from PayPal SetExpressCheckout.  Can also use token returned from SetCustomerBillingAgreement.
						);
						
		$ProfileDetails = array(
							'subscribername' => $this->config->item('username'), 					// Full name of the person receiving the product or service paid for by the recurring payment.  32 char max.
							'profilestartdate' => $StartDateGMT, 					// Required.  The date when the billing for this profiile begins.  Must be a valid date in UTC/GMT format.
							'profilereference' => '' 					// The merchant's own unique invoice number or reference ID.  127 char max.
						);
						
		$ScheduleDetails = array(
							'desc' => $this->config->item('sitename'), 								// Required.  Description of the recurring payment.  This field must match the corresponding billing agreement description included in SetExpressCheckout.
							'maxfailedpayments' => '', 					// The number of scheduled payment periods that can fail before the profile is automatically suspended.  
							'autobilloutamt' => 'AddToNextBilling' 						// This field indiciates whether you would like PayPal to automatically bill the outstanding balance amount in the next billing cycle.  Values can be: NoAutoBill or AddToNextBilling
						);
						
		$BillingPeriod = array(
							'trialbillingperiod' => '', 
							'trialbillingfrequency' => '', 
							'trialtotalbillingcycles' => '', 
							'trialamt' => '', 
							'billingperiod' => $cart['billing_period'], 				// Required.  Unit for billing during this subscription period.  One of the following: Day, Week, SemiMonth, Month, Year
							'billingfrequency' => '1', 					// Required.  Day, Week, SemiMonth, Month, Year Number of billing periods that make up one billing cycle.  The combination of billing freq. and billing period must be less than or equal to one year. 
							'totalbillingcycles' => '0', 				// the number of billing cycles for the payment period (regular or trial).  For trial period it must be greater than 0.  For regular payments 0 means indefinite...until canceled.  
							'amt' => $cart['price'], 					// Required.  Billing amount for each billing cycle during the payment period.  This does not include shipping and tax. 
							'currencycode' => 'USD', 					// Required.  Three-letter currency code.
							'shippingamt' => '', 						// Shipping amount for each billing cycle during the payment period.
							'taxamt' => '' 								// Tax amount for each billing cycle during the payment period.
						);
						
		$ActivationDetails = array(
							'initamt' => '', 							// Initial non-recurring payment amount due immediatly upon profile creation.  Use an initial amount for enrolment or set-up fees.
							'failedinitamtaction' => '', 				// By default, PayPal will suspend the pending profile in the event that the initial payment fails.  You can override this.  Values are: ContinueOnFailure or CancelOnFailure
						);
						
		$CCDetails = array(
							'creditcardtype' => 'Visa', 				// Required. Type of credit card.  Visa, MasterCard, Discover, Amex, Maestro, Solo.  If Maestro or Solo, the currency code must be GBP.  In addition, either start date or issue number must be specified.
							'acct' => $cart['card_number'], 				// Required.  Credit card number.  No spaces or punctuation.  
							'expdate' => $cart['card_expiration'], 						// Required.  Credit card expiration date.  Format is MMYYYY
							'cvv2' => $cart['card_cvv'], 							// Requirements determined by your PayPal account settings.  Security digits for credit card.
							'startdate' => '', 							// Month and year that Maestro or Solo card was issued.  MMYYYY
							'issuenumber' => ''							// Issue number of Maestro or Solo card.  Two numeric digits max.
						);
						
		$PayerInfo = array(
							'email' => $cart['buyer_email'], 	// Email address of payer.
							'payerid' => '', 							// Unique PayPal customer ID for payer.
							'payerstatus' => '', 						// Status of payer.  Values are verified or unverified
							'business' => '' 				// Payer's business name.
						);
						
		$PayerName = array(
							'salutation' => '', 						// Payer's salutation.  20 char max.
							'firstname' => $this->session->userdata('username'), 					// Payer's first name.  25 char max.
							'middlename' => '', 						// Payer's middle name.  25 char max.
							'lastname' => '', 				// Payer's last name.  25 char max.
							'suffix' => ''								// Payer's suffix.  12 char max.
						);
						
		$BillingAddress = array(
								'street' => '', 			// Required.  First street address.
								'street2' => '', 						// Second street address.
								'city' => '', 					// Required.  Name of City.
								'state' => '', 						// Required. Name of State or Province.
								'countrycode' => '', 					// Required.  Country code.
								'zip' => '', 						// Required.  Postal code of payer.
								'phonenum' => '' 						// Phone Number of payer.  20 char max.
							);
							
		$ShippingAddress = array(
								'shiptoname' => '', 					// Required if shipping is included.  Person's name associated with this address.  32 char max.
								'shiptostreet' => '', 					// Required if shipping is included.  First street address.  100 char max.
								'shiptostreet2' => '', 					// Second street address.  100 char max.
								'shiptocity' => '', 					// Required if shipping is included.  Name of city.  40 char max.
								'shiptostate' => '', 					// Required if shipping is included.  Name of state or province.  40 char max.
								'shiptozip' => '', 						// Required if shipping is included.  Postal code of shipping address.  20 char max.
								'shiptocountry' => '', 					// Required if shipping is included.  Country code of shipping address.  2 char max.
								'shiptophonenum' => ''					// Phone number for shipping address.  20 char max.
								);
								
		$PayPalRequestData = array(
							'CRPPFields' => $CRPPFields, 
							'ProfileDetails' => $ProfileDetails, 
							'ScheduleDetails' => $ScheduleDetails, 
							'BillingPeriod' => $BillingPeriod, 
							'ActivationDetails' => $ActivationDetails, 
							'CCDetails' => $CCDetails, 
							'PayerInfo' => $PayerInfo, 
							'PayerName' => $PayerName, 
							'BillingAddress' => $BillingAddress, 
							'ShippingAddress' => $ShippingAddress
						);	
						
		$PayPalResult = $this->paypal_pro->CreateRecurringPaymentsProfile($PayPalRequestData);
		
		if(!$this->paypal_pro->APICallSuccessful($PayPalResult['ACK']))
		{
			$errors = array('Errors'=>$PayPalResult['ERRORS']);

			$this->session->set_userdata('errors', $errors);
			
			if ($this->config->item('paypalMode')) {
				// Load errors to variable
				$this->load->vars('errors', $errors);
				$this->load->view('responseAjax');
			} else {
				redirect(site_url('user/subscription/'.$this->session->userdata('url')), 'Location');
			}
		}
		else
		{
			// Successful call.
			$cart['paypal_transaction'] = array('PayPalResult'=>$PayPalResult);
			$cart['paypal_payer_id'] = $PayPalResult['CORRELATIONID'];
			$cart['shopping_cart']['grand_total'] = $PayPalResult['REQUESTDATA']['AMT'];
			$cart['paypal_ack'] = $PayPalResult['ACK'];
			$cart['paypal_transaction_id'] = $PayPalResult['CORRELATIONID'];
			// Set example cart data into session
			$this->session->set_userdata('shopping_cart', $cart);
			// Successful Order
			redirect('paypal/PaymentComplete');
		}	
	}

	/**
	 * Order Complete - Pay Return Url
	 */
	function PaymentComplete()
	{
		// Get cart from session userdata
		$cart = $this->session->userdata('shopping_cart');
		if(empty($cart)) redirect('paypal/demos/express_checkout');
		$this->load->model('paypalModel');
		if ($cart['user_id'] === $this->session->userdata('id')) {
			// Set customer id and active subscription
			if ($userId = $this->paypalModel->updateUserSubscription($cart)) {
				// Set the next period
				if ($cart['type'] === '1') { // if recurring payment we set the end date
					$formatedPeriod = '+'.$cart['period'].' day';
					$cart['date_end'] = date("Y-m-d H:i:s", strtotime($formatedPeriod, time()));
				} else {
					$cart['date_end'] = date("Y-m-d H:i:s");
				}
				// Create subscription
				if ($paymentId = $this->paypalModel->activeSubscription($cart)) {
					// Send Invoice
					// TODO: get user datas and send invoice
					// $this->sendInvoice($userEmail, $paymentId, $cart['grand_total'], '$description');
					// Add notification
					$this->paypalModel->addNotification(3);
					if ($cart['type'] === '1') { // Type, 0: payment , 1: recurring
						$this->paypalModel->addNotification(4);
					}
					// Update Payment Stats
					$this->paypalModel->updatePaymentStats($type);
				}
			}
		}
		redirect(site_url('user/subscription/'.$this->session->userdata('url').'/?p=success'), 'Location');
	}

	/**
	 * Order Cancelled - Pay Cancel Url
	 */
	function OrderCancelled()
	{
		// Clear PayPalResult from session userdata
		$this->session->unset_userdata('PayPalResult');

		// Clear cart from session userdata
		$this->session->unset_userdata('shopping_cart');

		// Successful call.  Load view or whatever you need to do here.
		$this->load->view('paypal/order_cancelled');
	}

	public function sendInvoice($email, $idSubscription, $price, $description)
    {
        $this->load->library('email');
        $config = array(
                  'mailtype' => 'html',
                  'charset'  => 'utf-8',
                  'priority' => '1'
                   );
        $this->email->initialize($config);
        $this->email->set_newline("\r\n");
        $this->email->from($this->config->item('emailsite'), $this->config->item('author'));
        $this->email->to($email);
        $this->email->subject($this->config->item('titleMailConfirmation'));
        $data = array(
                 'message'  => $this->config->item('mailConfirmation'),
                 'idSubscription'  => $idSubscription,
                 'price'  => $price,
                 'description'  => $description
                 );
        $body = $this->load->view('email-templates/billing.php', $data, TRUE);
        $this->email->message($body);
        return $this->email->send();
    }

}