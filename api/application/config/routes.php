<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

//ROUTE FOR SISWA
$route['v1/siswa/login'] = 'v1/siswa/login';
$route['v1/siswa/dashboard'] = 'v1/siswa/dashboard';
$route['v1/siswa/profile'] = 'v1/siswa/profile';
$route['v1/siswa/checktoken'] = 'v1/siswa/checktoken';
//$route['v1/siswa/paket_pembelajaran'] = 'v1/siswa/paket_siswa';
$route['v1/siswa/paket_pembelajaran'] = 'v1/siswa/siswa_get_nilai';
$route['v1/siswa/detail_matpel'] = 'v1/siswa/siswa_detail_nilai';
$route['v1/siswa/detail_modul'] = 'v1/siswa/detail_modul';
$route['v1/siswa/file_upload'] = 'v1/siswa/file_upload';
$route['v1/siswa/change_profile'] = 'v1/siswa/change_profile';
$route['v1/siswa/submit_questions'] = 'v1/siswa/siswa_submit_questions';
$route['v1/siswa/nilai'] = 'v1/siswa/siswa_get_nilai';
$route['v1/siswa/detail_nilai'] = 'v1/siswa/siswa_detail_nilai';
