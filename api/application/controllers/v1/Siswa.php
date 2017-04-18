<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Siswa extends CI_Controller {

    function __construct() {

        parent::__construct();
        $this->load->helper('jwt_helper');
        $this->load->model('v1/Siswa_model');
        $this->load->helper(array('form', 'url'));
    }

    public function login() {
        echo JWT::encode($this->_siswa_login(), SERVER_SECRET_KEY);
//        echo json_encode($this->_siswa_login());
    }

    public function checktoken() {
        echo json_encode($this->_siswa_check_token());
    }

    public function profile() {
        echo json_encode($this->_siswa_profile());
    }

    public function dashboard() {
        echo json_encode($this->_siswa_dashboard());
    }

    public function paket_siswa() {
        echo json_encode($this->_siswa_paket());
    }

    public function detail_matpel() {
        echo json_encode($this->_siswa_detail_matpel());
    }

    public function detail_modul() {
        echo json_encode($this->_siswa_detail_modul());
    }

    public function siswa_submit_questions() {
        echo json_encode($this->_siswa_submit_questions());
    }

    public function siswa_get_nilai() {
        echo json_encode($this->_siswa_get_nilai());
    }

    public function siswa_detail_nilai() {
        echo json_encode($this->_siswa_detail_nilai());
    }

    public function file_upload() {
        echo json_encode($this->_siswa_file_upload());
    }

    public function change_profile() {
        echo json_encode($this->_siswa_change_profile());
    }

    private function _siswa_login() {
        $datas = json_decode(file_get_contents('php://input'));                
//        print_r($datas);exit();
        $params = new stdClass();
        $params->idsiswa = $datas->idsiswa;
        $params->password = $datas->password;        
        $loginvalidate = $this->Siswa_model->siswa_login($params);
        $role = SISWA_ROLE;
        if ($loginvalidate['response'] == TRUE) {
            $results = array("response" => "OK", "role" => $role, "data" => $loginvalidate['results']);
        } else {
            $results = array("response" => "FAIL", "role" => "", "data" => "");
        } 
        return $results;
    }

    private function _siswa_check_token() {
        $datas = json_decode(file_get_contents('php://input'));
        try {
            $results = JWT::decode($datas->token, SERVER_SECRET_KEY, JWT_ALGHORITMA);
            if ($results->role == SISWA_ROLE) {
                $response = "OK";
                $message = "Success";
                $data = $results->data->id_siswa;
            } else {
                $response = "FAIL";
                $message = "No permission";
                $data = "";
            }
        } catch (UnexpectedValueException $e) {
            $response = "FAIL";
            $message = $e->getMessage();
            $data = "";
        } catch (DomainException $e) {
            $response = "FAIL";
            $message = $e->getMessage();
            $data = "";
        }

        $data = array("response" => $response, "message" => $message, "id" => $data);
        return $data;
    }

    private function _siswa_dashboard() {

        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id = $datas->id_siswa;
            $siswa_profile = $this->Siswa_model->siswa_profile($id);
            $siswa_sekolah = $this->Siswa_model->siswa_sekolah($siswa_profile->id_sekolah);
            $siswa_paket = $this->Siswa_model->siswa_paket($siswa_profile->id_paket, "id_paket");
            $nama_paket = $siswa_paket[0]->nama;
            $ket_paket = $siswa_paket[0]->keterangan;
            $siswa_matpel = $this->Siswa_model->siswa_matpel($siswa_profile->id_paket, "id_paket");
            $jumlah_matpel = $siswa_matpel['count'];
            foreach ($siswa_matpel['results'] as $rows) {
                $siswa_modul[] = $this->Siswa_model->siswa_modul($rows->id_matpel, "id_matpel", FALSE);
            }
            foreach ($siswa_modul as $each) {
                $jumlah[] = $each['count'];
            }
            $jumlah_modul = array_sum($jumlah);
            $profil_image_dir = BASE_URL . SISWA_IMAGE_PROFILE_DIRECTORY . $siswa_profile->foto;
            $data_profile = array("profil" => $siswa_profile,
                "sekolah" => $siswa_sekolah,
                "paket" => $nama_paket,
                "ket_paket" => $ket_paket,
                "jumlah_matpel" => $jumlah_matpel,
                "jumlah_modul" => $jumlah_modul,
                "image_profile_dir" => $profil_image_dir
            );
        } else {
            $data_profile = "";
        }
        return $data_profile;
    }

    private function _siswa_paket() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id = $datas->id_siswa;
            $siswa_profile = $this->Siswa_model->siswa_profile($id);
            $siswa_paket = $this->Siswa_model->siswa_paket($siswa_profile->id_paket, "id_paket");
            $nama_paket = $siswa_paket[0]->nama;
            $keterangan_paket = $siswa_paket[0]->keterangan;
            $siswa_matpel = $this->Siswa_model->siswa_matpel($siswa_profile->id_paket, "id_paket");
            $jumlah_matpel = $siswa_matpel['count'];
            foreach ($siswa_matpel['results'] as $rows) {
//                $siswa_modul[] = $this->Siswa_model->siswa_modul($rows->id_matpel, "id_matpel", FALSE);
                $detail_matpel[] = array("id_matpel" => $rows->id_matpel, "nama_matpel" => $rows->nama, "keterangan_matpel" => $rows->keterangan);
            }
            $data_paket = array(
                "nama_paket" => $nama_paket,
                "keterangan_paket" => $keterangan_paket,
                "jumlah_matpel" => $jumlah_matpel,
                "paket_matpel" => $detail_matpel
            );
        } else {
            $data_paket = "";
        }
        return $data_paket;
    }

    private function _siswa_detail_matpel() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id_siswa = $datas->id_siswa;
            $id_matpel = $datas->id_matpel;
            $get_matpel = $this->Siswa_model->siswa_matpel($id_matpel, "id_matpel");
            $get_modul = $this->Siswa_model->siswa_modul($id_matpel, "id_matpel", FALSE);
            foreach ($get_modul['results'] as $rows) {
                $each_modul[] = array("id_modul" => $rows->id_modul, "judul_modul" => $rows->judul);
            }
            $jumlah_modul = count($each_modul);
            $detail_matpel = array(
                "detail_matpel" => $get_matpel['results'],
                "modul_matpel" => $each_modul,
                "jumlah_modul" => $jumlah_modul);
        } else {
            $detail_matpel = "";
        }
        return $detail_matpel;
    }

    private function _siswa_detail_modul() {

        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id_siswa = $datas->id_siswa;
            $id_modul = $datas->id_modul;
            $get_modul = $this->Siswa_model->siswa_modul($id_modul, "id_modul", TRUE);
            $modul['id_modul'] = $get_modul['results']['modul'][0]->id_modul;
            $modul['tgl_upload'] = $get_modul['results']['modul'][0]->tgl_upload;
            $modul['judul'] = $get_modul['results']['modul'][0]->judul;
            $modul['file'] = MODUL_DIRECTORY . $get_modul['results']['modul'][0]->file;
            $modul['filename'] = $get_modul['results']['modul'][0]->file;
            $modul['video'] = $get_modul['results']['modul'][0]->video;
            if (count($get_modul['results']['soal_modul']) == 0) {
                $modul['soal'] = 'NONE';
            } else {
                $modul['soal'] = $get_modul['results']['soal_modul'];
            }
            $check_questions = $this->Siswa_model->siswa_check_question($id_siswa, $id_modul);
            if ($check_questions['status'] == 'OK') {
                $modul['questions'] = array("nilai_akhir" => $check_questions['record'][0]->nilai, "jumlah_benar" => $check_questions['record'][0]->benar, "jumlah_salah" => $check_questions['record'][0]->salah, "tgl_selesai" => $check_questions['record'][0]->tgl);
                $response = 'OK';
                $message = "Success";
                $data = $modul;
            } elseif ($check_questions['status'] == 'NONE') {
                $modul['questions'] = 'NONE';
                $response = "OK";
                $message = "Success";
                $data = $modul;
            } else {
                $modul['questions'] = 'FAILED';
                $response = "OK";
                $message = "Success";
                $data = $modul;
            }
        } else {
            $response = 'FAILED';
            $message = "Load Data Failed";
            $data = "";
        }
        //        echo json_encode($modul);
        //        exit();
        $response = array("response" => $response, "message" => $message, "data" => $data);
        return $response;
    }

    private function _siswa_profile() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id = $datas->id_siswa;
            $siswa_profile = $this->Siswa_model->siswa_profile($id);
            $siswa_sekolah = $this->Siswa_model->siswa_sekolah($siswa_profile->id_sekolah);
            $profil_image_dir = BASE_URL . SISWA_IMAGE_PROFILE_DIRECTORY . $siswa_profile->foto;
            $data_profile = array(
                "profil" => $siswa_profile,
                "sekolah" => $siswa_sekolah,
                "image_profile_dir" => $profil_image_dir
            );
        } else {
            $data_profile = "";
        }
        return $data_profile;
    }

    private function _siswa_file_upload() {
        $datas = $this->input->request_headers();
        $datas = $this->input->get_request_header('action', TRUE);

        if ($datas == SISWA_ACTION_UPLOAD_IJAZAH OR $datas == SISWA_ACTION_UPLOAD_SKHUN) {
            $config['allowed_types'] = 'jpg|png';
            $config['encrypt_name'] = TRUE;
            $config['max_size'] = "2048000";
            if ($datas == SISWA_ACTION_UPLOAD_IJAZAH) {
                $config['upload_path'] = "assets/images/siswa-ijazah/";
                $message = "Ijazah berhasil diupdate";
            } elseif ($datas == SISWA_ACTION_UPLOAD_SKHUN) {
                $config['upload_path'] = "assets/images/siswa-skhun/";
                $message = "SKHUN berhasil diupdate";
            }
        }

        $this->load->library('upload', $config);
        $this->upload->initialize($config);
        $upload_file = $this->upload->do_upload('file');
        if (!$upload_file) {
            $datas = array('response' => 'FAIL', 'message' => $this->upload->display_errors());
        } else {
            $datas = array('response' => 'OK', 'message' => $message, 'filename' => $this->upload->data('file_name'));
        }
        return $datas;
    }

    private function _siswa_get_nilai() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id = $datas->id_siswa;
            try {
                $siswa_profile = $this->Siswa_model->siswa_profile($id);
                $siswa_paket = $this->Siswa_model->siswa_paket($siswa_profile->id_paket, "id_paket");
                $siswa_matpel = $this->Siswa_model->siswa_matpel($siswa_profile->id_paket, "id_paket");
                $params = new stdClass();
                $filter = new stdClass();
                foreach ($siswa_matpel['results'] as $rows) {
                    $params->param1 = "id_matpel";
                    $filter->filter1 = $rows->id_matpel;
                    $filter->id_siswa = $id;
                    $get_nilai = $this->Siswa_model->siswa_get_nilai($params, $filter);
                    $jumlah_modul = $this->Siswa_model->siswa_count_modul("id_matpel", $rows->id_matpel);
                    $data_nilai[] = array("id_matpel" => $rows->id_matpel, "nama_matpel" => $rows->nama, "keterangan_matpel" => $rows->keterangan, "total_modul_matpel" => $jumlah_modul, "total_modul_selesai" => count($get_nilai));
                    $total_modul[] = $jumlah_modul;
                    $total_modul_selesai[] = count($get_nilai);
                }
                $res = "Success";
                $msg = "Success to load data";
                $data = array("nama_paket" => $siswa_paket[0]->nama, "keterangan_paket" => $siswa_paket[0]->keterangan, "data_nilai" => $data_nilai, "total_matpel" => $siswa_matpel['count'], "total_modul" => array_sum($total_modul), "total_modul_selesai" => array_sum($total_modul_selesai));
            } catch (Exception $e) {
                $res = "FAIL";
                $msg = $e->getMessage();
                $data = "";
            }
//            }
        } else {
            $res = 'FAIL';
            $msg = "Token missmatch";
            $data = "";
        }

        $response = array("response" => $res, "message" => $msg, "data" => $data);
        return $response;
    }

    private function _siswa_detail_nilai() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $id_siswa = $datas->id_siswa;
            $id_matpel = $datas->id_matpel;
            $params = new stdClass();
            $filter = new stdClass();
            try {
                $matpel_detail = $this->Siswa_model->siswa_matpel("$id_matpel", "id_matpel");
                $matpel_modul = $this->Siswa_model->siswa_modul($id_matpel, "id_matpel", FALSE);
//                    print_r($matpel_detail['results']);
                foreach ($matpel_modul['results'] as $row) {

                    $params->param1 = "id_modul";
                    $filter->filter1 = $row->id_modul;
                    $filter->id_siswa = $id_siswa;
                    $modul_nilai = $this->Siswa_model->siswa_get_nilai($params, $filter);
                    if (empty($modul_nilai[0])) {
                        $nilai = '0';
                        $nilai_selesai = '0';
                        $date = '';
                    } else {
                        $nilai = $modul_nilai[0]->nilai;
                        $nilai_selesai = '1';
                        $date = $modul_nilai[0]->tgl;
                    }
                    $modul_selesai[] = $nilai_selesai;

                    $result[] = array("id_modul" => $row->id_modul, "judul_modul" => $row->judul, "nilai_modul" => $nilai, "tgl_selesai" => $date);
                }
//                print_r($nilai_selesai);
                $jumlah_modul = count($result);
                $res = "OK";
                $msg = "Success to load data";
                $data = array("nama_matpel" => $matpel_detail['results'][0]->nama,
                    "ket_matpel" => $matpel_detail['results'][0]->keterangan,
                    "data_nilai_modul" => $result,
                    "total_modul" => $jumlah_modul,
                    "total_modul_selesai" => array_sum($modul_selesai));
            } catch (Exception $e) {
                $res = "FAIL";
                $msg = $e->getMessage();
                $data = "";
            }
//            }
        } else {
            $res = 'FAIL';
            $msg = "Token missmatch";
            $data = "";
        }

        $response = array("response" => $res, "message" => $msg, "data" => $data);
        return $response;
    }

    private function _siswa_change_profile() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $datas = json_decode(file_get_contents('php://input'));
            $action = $datas->action;
            switch ($action) {
                case SISWA_EDIT_PROFILE_TAB :
                    return $data = $this->_siswa_change_profile_tab($datas);
                    break;
                case SISWA_EDIT_PENDIDIKAN_TAB:
                    return $data = $this->_siswa_change_pendidikan_tab($datas);
                    break;
                case SISWA_EDIT_AKUN_TAB:
                    return $data = $this->_siswa_change_akun_tab($datas);
                    break;
                case SISWA_EDIT_IJAZAH:
                    return $data = $this->_siswa_change_ijazah($datas);
                    break;
                case SISWA_EDIT_SKHUN:
                    return $data = $this->_siswa_change_skhun($datas);
                    break;
            }
        }
        return $data;
    }

    private function _siswa_change_profile_tab($datas) {
        $params = $datas;
        $update_siswa_profile_tab = $this->Siswa_model->siswa_update_profile_tab($params);
        if ($update_siswa_profile_tab == "OK") {
            $datas = array('response' => 'OK', 'message' => 'Profil berhasil diubah');
        } else {
            $datas = array('response' => 'FAIL', 'message' => 'Profil gagal diubah !');
        }
        return $datas;
    }

    private function _siswa_change_pendidikan_tab($datas) {
        $params = $datas;
        $update_siswa_pendidikan_tab = $this->Siswa_model->siswa_update_pendidikan_tab($params);
        if ($update_siswa_pendidikan_tab == "OK") {
            $datas = array('response' => 'OK', 'message' => 'Pendidikan berhasil diubah');
        } else {
            $datas = array('response' => 'FAIL', 'message' => 'Pendidikan gagal diubah !');
        }
        return $datas;
    }

    private function _siswa_change_akun_tab($datas) {
        print_r($datas);
    }

    private function _siswa_change_ijazah($datas) {
        $params = $datas;
        $update_siswa_profile_tab = $this->Siswa_model->siswa_update_ijazah($params);
        if ($update_siswa_profile_tab == "OK") {
            $datas = array('response' => 'OK', 'message' => 'Ijazah berhasil diubah');
        } else {
            $datas = array('response' => 'FAIL', 'message' => 'Ijazah gagal diubah !');
        }
        return $datas;
    }

    private function _siswa_change_skhun($datas) {
        $params = $datas;
        $update_siswa_profile_tab = $this->Siswa_model->siswa_update_skhun($params);
        if ($update_siswa_profile_tab == "OK") {
            $datas = array('response' => 'OK', 'message' => 'SKHUN berhasil diubah');
        } else {
            $datas = array('response' => 'FAIL', 'message' => 'SKHUN gagal diubah !');
        }
        return $datas;
    }

    private function _siswa_submit_questions() {
        $check_token = $this->_siswa_check_token();
        if ($check_token['response'] != "FAIL") {
            $data = json_decode(file_get_contents('php://input'));
            $params = new stdClass();
            foreach ($data->data_input as $each) {
                $params->id_soal = $each->id_soal;
                if (!isset($each->jawaban)) {
                    $params->jawaban = "N";
                }
                $params->jawaban = $each->jawaban;
                $get_point = $this->Siswa_model->siswa_get_point($params);
                if ($each->jawaban == $get_point['kunci']) {
                    $hasil = TRUE;
                } else {
                    $hasil = FALSE;
                }
                $nilai[] = $hasil;
                $count_soal[] = count($each->id_soal);
            }
            $jumlah_soal = count($count_soal);
            $max_nilai = 100;
            $nilai_per_soal = ceil($max_nilai / $jumlah_soal);
            foreach ($nilai as $nilai_lagi) {
                if ($nilai_lagi == TRUE) {
                    $each_nilai[] = $nilai_per_soal;
                    $benar[] = TRUE;
                } else {
                    $each_nilai[] = '0';
                    $salah[] = TRUE;
                }
            }

            if (isset($benar)) {
                $count_benar = count($benar);
            } else {
                $count_benar = '0';
            }
            if (isset($salah)) {
                $count_salah = count($salah);
            } else {
                $count_salah = '0';
            }
            $nilai_akhir = (ceil(array_sum($each_nilai)));
            if ($nilai_akhir > $max_nilai) {
                $nilai_akhir = '100';
            }
            if ($nilai_akhir < 0) {
                $nilai_akhir = '0';
            }
            $params->id_modul = $data->id_modul;
            $params->id_siswa = $data->id_siswa;
            $params->nilai = $nilai_akhir;
            $params->salah = $count_salah;
            $params->benar = $count_benar;
            $addscore = $this->Siswa_model->siswa_add_point($params);
            if ($addscore == "OK") {
                $response = "OK";
                $message = "Success";
            } else {
                $response = "FAILED";
                $message = "Failed to add data score";
            }
            $result = array("nilai_akhir" => $nilai_akhir, "jumlah_benar" => $count_benar, "jumlah_salah" => $count_salah, "tgl_selesai" => date("Y-m-d"));
        } else {
            $response = "FAILED";
            $message = "Failed to count";
            $result = "";
        }
        $datas = array("response" => $response, "message" => $message, "data" => $result);
        return $datas;
    }

}