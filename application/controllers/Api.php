<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if($this->config->item('cache_activation') === 1) {
            $this->output->cache($this->config->item('cache_expire'));
        }
        if($this->config->item('cache_activation') === 2) {
            $this->output->delete_cache();
        }
        $this->load->model(array('apiModel'));
    }

    public function index()
    {
        
    }

    public function json($getRequest = '', $getUser = '')
    {
        if ($getRequest === 'number-of-videos') {
            $getCategories = $this->apiModel->getCategories();
            foreach ($getCategories as $category) {
                $data['number-of-videos'][] = $this->apiModel->getNbVideos($category);
            }
            $data['msg'] = json_encode($data);
        } elseif($getRequest === 'total-users') {
            $data['number-users'] = $this->apiModel->getTotalUsers();
            $data['msg'] = json_encode($data);
        } elseif($getRequest === 'user') {
            $data['user'] = $this->apiModel->getUser($getUser);
            $data['msg'] = json_encode($data);
        } else {
            $data['msg'] = 'Bad request';

        }
        $this->load->view('responseAjax', $data);
    }
}
