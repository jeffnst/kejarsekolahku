<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Siswa_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    public function siswa_login($params) {
        //$params = 'id_siswa' & 'password'
        $sql = "SELECT `id_siswa` FROM `siswa` WHERE `id_siswa` = '{$params->idsiswa}' AND `password` = '{$params->password}'";
        $query = $this->db->query($sql);
        $count = $query->num_rows();
        $rows = $query->row();
        if ($count < 1) {
            $response = FALSE;
            $data = array("response" => $response, "results" => $rows);
        } else {
            $response = TRUE;
            $data = array("response" => $response, "results" => $rows);
        }
        return $data;
    }

    public function siswa_profile($params) {
        //$params = 'id_siswa'        
        $sql = "SELECT 
               `siswa`.`id_siswa`,
               `siswa`.`id_sekolah`,
               `siswa`.`id_paket`,
               `siswa`.`nama` as `nama_siswa`,               
               `siswa`.`foto`,               
               `siswa`.`email` as `email_siswa`,               
               `siswa`.`telp` as `kontak_siswa`,
               `siswa`.`alamat` as `alamat_siswa`,
               `siswa`.`tmp_lhr` as `tmp_lhr_siswa`,
               `siswa`.`tgl_lhr` as `tgl_lhr_siswa`,
               `siswa`.`nama_ortu` as `ortu_siswa`,
               `siswa`.`pdkn` as `pdkn_siswa`,
               `siswa`.`jenjang` as `nama_sekolah_siswa`,
               `siswa`.`thn_lulus` as `thn_lulus_siswa`,
               `siswa`.`no_ijasah` as `no_ijasah_siswa`,
               `siswa`.`no_skhun` as`no_skhun_siswa`,
               `siswa`.`foto_ijasah` as `foto_ijazah_siswa`,
               `siswa`.`foto_skhun` as `foto_skhun_siswa`,
               `siswa`.`jnsklmn` as `kelamin_siswa`,
               `siswa`.`agama` as `agama_siswa`,
               
               
                `penjab`.`id_penjab` , 
                `penjab`.`nama` as `nama_penjab` , 
                `penjab`.`email` as `email_penjab` , 
                `penjab`.`kontak` as `kontak_penjab`,
                
                `paket`.`nama` as `nama_paket`,
                `matpel`.`id_matpel`,
                `modul`.`id_modul`
                
                
                FROM `siswa` 
                
                JOIN `sekolah` ON `siswa`.`id_sekolah` = `sekolah`.`id_sekolah`
                JOIN `penjab` ON `sekolah`.`id_penjab` = `penjab`.`id_penjab`
                JOIN `paket` ON `siswa`.`id_paket` =   `paket`.`id_paket` 
                JOIN `matpel` ON `paket`.`id_paket` =   `matpel`.`id_paket` 
                JOIN `modul` ON `matpel`.`id_matpel` =   `modul`.`id_matpel` 
                WHERE `siswa`.`id_siswa` = '{$params}'";
        $query = $this->db->query($sql);
        $count = $query->num_rows();
        $rows = $query->row();
//        $data = array("results" => $rows);
        return $rows;
    }

    public function siswa_sekolah($params) {
        //$params = 'id_sekolah'
        $sql = "SELECT 
                `sekolah`.`nama` as `nama_sekolah` , 
                `sekolah`.`telp` as `kontak_sekolah`, 
                `sekolah`.`prov` as `prov_sekolah`, 
                `sekolah`.`alamat` as `alamat_sekolah`
                FROM `sekolah`
                WHERE `sekolah`.`id_sekolah` = '{$params}'";
        $query = $this->db->query($sql);
        $rows = $query->row();
        return $rows;
    }

    public function siswa_paket($params, $filter) {
        //$params = 'id_paket'
        $sql = "SELECT * FROM `paket` WHERE `{$filter}` = '{$params}'";
        $query = $this->db->query($sql);
        $rows = $query->result();
        return $rows;
    }

    public function siswa_matpel($params, $filter) {
        //$params = 'id_paket'
        $sql = "SELECT * FROM `matpel` WHERE `{$filter}` = '{$params}'";
        $query = $this->db->query($sql);
        $count = $query->num_rows();
        $rows = $query->result();
        $data = array("count" => $count, "results" => $rows);
        return $data;
    }

    public function siswa_modul($params, $filter, $getsoal) {
        //$params = 'id_matpel'        
        if ($getsoal == TRUE) {
            $sql = "SELECT * FROM `modul` WHERE `{$filter}` = '{$params}'";
            $sql2 = "SELECT * FROM `soal_modul` WHERE `{$filter}` = '{$params}'";
            $query2 = $this->db->query($sql2);
            $query = $this->db->query($sql);
            $count = $query->num_rows();
            $rows = array("modul" => $query->result(), "soal_modul" => $query2->result());
        } else {
            $sql = "SELECT * FROM `modul` WHERE `{$filter}` = '{$params}'";
            $query = $this->db->query($sql);
            $count = $query->num_rows();
            $rows = $query->result();
        }
        $data = array("count" => $count, "results" => $rows);
        return $data;
    }
  
    public function siswa_count_modul($filter, $params) {
        $sql = "SELECT * FROM `modul` WHERE `{$filter}` = '{$params}'";
        $query = $this->db->query($sql);
        $count = $query->num_rows();
        return $count;
    }

    public function siswa_update_profile_tab($params) {

        $sql = " UPDATE `siswa` SET
            
               `nama` ='{$params->data_input->nama_siswa}', 
               `jnsklmn` = '{$params->data_input->kelamin_siswa}',
               `tmp_lhr` = '{$params->data_input->tmp_lhr_siswa}',
               `tgl_lhr` = '{$params->data_input->tgl_lhr_siswa}',    
               `agama` = '{$params->data_input->agama_siswa}',   
               `nama_ortu` = '{$params->data_input->ortu_siswa}',   
               `telp` = '{$params->data_input->kontak_siswa}',    
               `alamat` = '{$params->data_input->alamat_siswa}',
               `jnsklmn` ='{$params->data_input->kelamin_siswa}'
                   
                WHERE `id_siswa`='{$params->id_siswa}' ";
        $query = $this->db->query($sql);
        if ($query == TRUE) {
            $data = "OK";
        } else {
            $data = "FAIL";
        }
        return $data;
    }

    public function siswa_update_pendidikan_tab($params) {

        $sql = " UPDATE `siswa` SET
            
               `pdkn` ='{$params->data_input->pdkn_siswa}', 
               `jenjang` = '{$params->data_input->nama_sekolah_siswa}',
               `thn_lulus` = '{$params->data_input->thn_lulus_siswa}',
               `no_skhun` = '{$params->data_input->no_skhun_siswa}',    
               `no_ijasah` = '{$params->data_input->no_ijasah_siswa}'
                   
                WHERE `id_siswa`='{$params->id_siswa}' ";
        $query = $this->db->query($sql);
        if ($query == TRUE) {
            $data = "OK";
        } else {
            $data = "FAIL";
        }
        return $data;
    }

    public function siswa_update_ijazah($params) {
        $sql = " UPDATE `siswa` SET `foto_ijasah` ='{$params->data_input->ijazahimgname}' WHERE `id_siswa`='{$params->id_siswa}' ";
        $query = $this->db->query($sql);
        if ($query == TRUE) {
            $data = "OK";
        } else {
            $data = "FAIL";
        }
        return $data;
    }

    public function siswa_update_skhun($params) {
        $sql = " UPDATE `siswa` SET `foto_skhun` ='{$params->data_input->skhunimgname}' WHERE `id_siswa`='{$params->id_siswa}' ";
        $query = $this->db->query($sql);
        if ($query == TRUE) {
            $data = "OK";
        } else {
            $data = "FAIL";
        }
        return $data;
    }

    public function siswa_get_point($params) {
        $sql = "SELECT `kunci` FROM `soal_modul` WHERE `id_soal_modul` = '{$params->id_soal}'";
        $query = $this->db->query($sql);
        if ($query == TRUE) {
            $status = "OK";
            $record = $query->result();
        } else {
            $status = "FAIL";
            $record = "";
        }
        $data = array("status" => $status, "kunci" => $record[0]->kunci);
        return $data;
    }

    public function siswa_add_point($params) {
        $sql = "INSERT INTO `nilai_soal` VALUES('','{$params->id_modul}','{$params->id_siswa}','{$params->nilai}','{$params->salah}','{$params->benar}','',now())";
        $query = $this->db->query($sql);
        if ($query == TRUE) {
            $status = "OK";
        } else {
            $status = "FAIL";
        }
        return $status;
    }

    public function siswa_check_question($id_siswa, $id_modul) {
        $sql = "SELECT * FROM `nilai_soal` WHERE `id_modul` = '{$id_modul}' AND `id_siswa` = '{$id_siswa}'";
        $query = $this->db->query($sql);
        $row = $query->num_rows();
        if ($query == TRUE) {
            if ($row == '1') {
                $status = "OK";
                $record = $query->result();
            } else {
                $status = "NONE";
                $record = "";
            }
        } else {
            $status = "FAILED";
        }
        $data = array("status" => $status, "record" => $record);
        return $data;
    }

    public function siswa_get_nilai($params, $filter) {
//        print_r($params);
        $sql = "SELECT * FROM `nilai_soal` as `ns` join `modul` as `m` on `ns`.`id_modul` = `m`.`id_modul` where `m`.`{$params->param1}` = '{$filter->filter1}' AND `ns`.`id_siswa` = '{$filter->id_siswa}'";
        $query = $this->db->query($sql);
        $result = $query->result();
        
        return $result;
    }
}