<?php
defined('BASEPATH') OR die('No direct script access allowed!');

class Gaji extends CI_Controller{

    public function __construct()
    {
        parent::__construct();
        is_login();
        $this->load->helper('Tanggal');
        $this->load->model('Gaji_model', 'gaji');
        $this->load->model('Karyawan_model', 'karyawan');
    }

    public function index()
    {   
        $data = $this->rekap_gaji();
        $this->template->load('template', 'gaji/gaji', $data);
    }

    public function export_pdf()
    {
        $this->load->library('pdf');
        $data = $this->rekap_gaji();
        $html_content = $this->load->view('gaji/print', $data, true);
        $filename = 'Rekap Absensi - ' . bulan($data['bulan']) . ' ' . $data['tahun'] . '.pdf';

        $this->pdf->setPaper('landscape');
        $this->pdf->loadHtml($html_content);
        $this->pdf->render();
        $this->pdf->stream($filename);
    }

    public function export()
    {
        // panggil library yang kita buat sebelumnya yang bernama pdfgenerator
        $this->load->library('pdf2');
        
        // title dari pdf
        $this->data['title_pdf'] = 'Rekap Absensi';
        
        // filename dari pdf ketika didownload
        $file_pdf = 'rekap_absesi';
        // setting paper
        $paper = 'F4';
        //orientasi paper potrait / landscape
        $orientation = "landscape";
        $data2 = $this->rekap_gaji();
		$html = $this->load->view('gaji/print',$data2, true);	    
        
        // run dompdf
        $this->pdf2->generate($html, $file_pdf,$paper,$orientation);
    }
    
    public function rekap_gaji(){
        $bulan = @$this->input->get('bulan') ? $this->input->get('bulan') : date('m');
        $tahun = @$this->input->get('tahun') ? $this->input->get('tahun') : date('Y');
        $data['all_bulan'] = bulan();
        $data['bulan'] = $bulan;
        $data['tahun'] = $tahun;
        $data['hari'] = hari_bulan($bulan, $tahun);
        $data['gaji'] = $this->gaji->get_gaji($bulan, $tahun);
        $data['karyawan'] = $this->karyawan->get_all();
        return $data;
    }

    

}