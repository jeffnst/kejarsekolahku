/* 
 * File ini adalah file base untuk Factory token siswa
 */

angularapp.factory('SiswaTokenFactory', function ($http) {
    var factory = {};
    var api = 'http://pkbm-ksi.sch.id/api/v1/siswa/';
    
    factory.checkToken = function (datas) {
        return $http.post(api + 'checktoken', datas);
    };
    return factory;
});