<?php

class gaji_model extends CI_Model
{
    function get_gaji($bulan, $tahun){
        $this->db->select("id_user, nama, divisi,
        round(( masuk /20 * 100 ),2) as persen_hadir, 
        masuk as jumlah_hadir, (20 - masuk ) as jumlah_tdk_hadir,
        2250000 - (20 - masuk) * 11250 as uang_diterima, bulan, tahun");
        $this->db->from('rekap_count rc');
        $this->db->where('bulan',$bulan);
        $this->db->where('tahun',$tahun);
        $result = $this->db->get();
        return $result->result_array();
    }
}
