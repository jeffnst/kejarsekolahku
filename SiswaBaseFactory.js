/* 
 * File ini adalah file base untuk Factory siswa
 */

var factory = {};
var api = 'http://pkbm-ksi.sch.id/api/v1/siswa/';

angularapp.factory('loginSiswaFactory', function ($http) {
    factory.getUserValidLogin = function (datas) {
//        console.log("factory :" + JSON.stringify(datas));
        return $http.post(api + 'login', datas);        
    };
    return factory;
});

angularapp.factory('DataSiswaFactory', function ($http) {
    factory.getSiswaDashboard = function (datas) {
//        console.log("factory :" + JSON.stringify(datas));
        return $http.post(api + 'dashboard', datas);        
    };
    return factory;
});

angularapp.factory('ProfileSiswaFactory', function ($http) {
    factory.getSiswaProfile = function (datas) {
//        console.log("factory :" + JSON.stringify(datas));
        return $http.post(api + 'profile', datas);        
    };
    factory.SaveSiswaProfile = function (datas){
//         console.log("factory :" + JSON.stringify(datas));
         return $http.post(api + 'change_profile', datas);        
    }
    return factory;
});


angularapp.factory('PaketPembelajaranSiswaFactory', function ($http) {
    factory.getPaketSiswa = function (datas) {
//        console.log("factory :" + JSON.stringify(datas));
        return $http.post(api + 'paket_pembelajaran', datas);        
    };
    return factory;
});

angularapp.factory('DetailMatpelSiswaFactory', function ($http) {
    factory.getDetailMatpel = function (datas) {
//        console.log("factory :" + JSON.stringify(datas));
        return $http.post(api + 'detail_matpel', datas);        
    };
    return factory;
});

angularapp.factory('DetailModulSiswaFactory', function ($http) {
    factory.getModulMatpel = function (datas) {
//        console.log("factory :" + JSON.stringify(datas));
        return $http.post(api + 'detail_modul', datas);        
    };
    return factory;
});
