<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Coffee Theme
 *
 * PHP version >= 7.0.0
 *
 * @category  PHP
 * @package   VideoTube - PHP Script
 * @author    Nicolas Grimonpont <support@coffeetheme.com>
 * @copyright 2010-2018 Nicolas Grimonpont
 * @license   Standard License
 * @link      http://coffeetheme.com/
 */

// Include Pesapal OAuth
require_once 'pesapal-php/pesapal-oauth.php';

class Pesapal
{
    private $consumer_key;
    private $consumer_secret;

    public function __construct()
    {
        // Grab API key from config instead
        $this->ci = &get_instance();
        $this->consumer_key = $this->ci->config->item('pesapalConsumerKey');
        $this->consumer_secret = $this->ci->config->item('pesapalConsumerSecret');
        $this->iframelink = ($this->ci->config->item('pesapalDemo') === '1') ? 'http://demo.pesapal.com/api/PostPesapalDirectOrderV4' : 'https://www.pesapal.com/API/PostPesapalDirectOrderV4';
    }

    public function pesapalPayment($data, $userUrl, $reference)
    {
        $token = $params = NULL;
        $consumer_key = $this->consumer_key;
        $consumer_secret = $this->consumer_secret;
        $iframelink = $this->iframelink;
        $signature_method = new OAuthSignatureMethod_HMAC_SHA1();
        // Payment details
        $type = NULL;
        if ($this->ci->input->post('subscription') === 'pesapal2') {
            $amount = $this->ci->config->item('pesapal2Price');
            $desc = $this->ci->config->item('pesapal2Description');
            $type = 2;
            $callback_url = site_url('/user/subscription/' . $userUrl . '/?type=2');
        } elseif ($this->ci->input->post('pesapalSubscription') === 'pesapal3') {
            $amount = $this->ci->config->item('pesapal3Price');
            $desc = $this->ci->config->item('pesapal3Description');
            $type = 3;
            $callback_url = site_url('/user/pesapalSubscription/' . $userUrl . '/?type=3');
        } else {
            $amount = $this->ci->config->item('pesapal1Price');
            $desc = $this->ci->config->item('pesapal1Description');
            $type = 1;
            $callback_url = site_url('/user/pesapalSubscription/' . $userUrl . '/?type=1');
        }
        $amount = number_format($amount, 2);//format amount to 2 decimal places
        $type = 'MERCHANT'; // default value = MERCHANT
        // User details
        $first_name = $data['username'];
        $last_name = '';
        $email = $data['email'];
        $phonenumber = ''; // ONE of email or phonenumber is required
        // Send request
        $post_xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?><PesapalDirectOrderInfo xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" Amount=\"" . $amount . "\" Description=\"" . $desc . "\" Type=\"" . $type . "\" Reference=\"" . $reference . "\" FirstName=\"" . $first_name . "\" LastName=\"" . $last_name . "\" Email=\"" . $email . "\" PhoneNumber=\"" . $phonenumber . "\" xmlns=\"http://www.pesapal.com\" />";
        $post_xml = htmlentities($post_xml);
        $consumer = new OAuthConsumer($consumer_key, $consumer_secret);
        // Post transaction to pesapal
        $iframe_src = OAuthRequest::from_consumer_and_token($consumer, $token, "GET", $iframelink, $params);
        $iframe_src->set_parameter("oauth_callback", $callback_url);
        $iframe_src->set_parameter("pesapal_request_data", $post_xml);
        $iframe_src->sign_request($signature_method, $consumer, $token);
        $iframe = '<iframe src="' . $iframe_src . '" width="100%" height="630px"  scrolling="no" frameBorder="0">
                        <p>Browser unable to load iFrame</p>
                    </iframe>';
        return $iframe;
    }
}
