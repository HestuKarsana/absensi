<?php
defined('BASEPATH') OR die('No direct script access allowed!');

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_login();
    }

    public function index()
    {
        // if (is_level('Karyawan')) {
        //     return $this->load->view('dashboard2');
        // } else {
            return $this->template->load('template', 'dashboard');
        // }
        
    }

    public function logout()
    {
        $this->session->sess_destroy();
        session_destroy();
        redirect(base_url("auth"));
    }
}



/* End of File: d:\Ampps\www\project\absen-pegawai\application\controllers\Dashboard.php */