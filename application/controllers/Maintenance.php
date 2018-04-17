<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Maintenance extends CI_Controller
{
    public function index()
    {
        $this->autoloadModel->setThemeSession();
        $data['title'] = $this->config->item('sitename').' - '.$this->lang->line('Maintenance');
        $data['message'] = $this->config->item('maintenance_message');
        $content = $this->load->view($this->session->theme.'/maintenance', $data, true);
        $this->load->view('landing', array('content' => $content));
    }
}
