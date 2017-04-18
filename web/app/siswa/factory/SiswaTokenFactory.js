/* 
 * File ini adalah file base untuk Factory token siswa
 */

angularapp.factory('SiswaTokenFactory', function ($http) {
    var factory = {};
//    var api = 'http://localhost/pkbmksi-web/api/v1/siswa/';
    var api = 'http://kejarsekolahku.hol.es/api/v1/siswa/';

    factory.checkToken = function (datas) {
        return $http.post(api + 'checktoken', datas);
    };
    return factory;
});