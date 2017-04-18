
var factories = angular.module('starter.factories', []);

factories.factory('LoginFactory', function ($http, api) {
    var data = {};
    data.getUserValidLogin = function (datas) {
        //        console.log("factory :" + JSON.stringify(datas));
//        return $http.post(api + 'login', datas);
        return $http({
            method: 'POST',
            url: api + 'login',
            data: datas
        })
    };
    return data;
});

factories.factory('TokenFactory', function ($http, api) {
    var data = {};
    data.checkToken = function (datas) {
        return $http.post(api + 'checktoken', datas);
    };
    return data;
});

factories.factory('SiswaFactory', function ($http, api) {
    var data = {};
    data.GetDataDashboard = function (datas) {
        return $http.post(api + 'dashboard', datas);
    };

    data.GetDataPackages = function (datas) {
        return $http.post(api + 'paket_pembelajaran', datas);
    };

    data.GetDataMatpel = function (datas) {
        return $http.post(api + 'detail_matpel', datas);
    };

    data.GetDataModul = function (datas) {
//        console.log(JSON.stringify(datas));
//        return $http.post(api + 'detail_modul', datas);
        return $http({
            method: 'POST',
            url: api + 'detail_modul',
            headers: {
                "Access-Control-Allow-Origin": '*'
            },
            data: datas
        });
    };

    data.GetDataNilai = function (datas) {
        return $http.post(api + 'nilai', datas);
    };
    
    data.GetDetailNilaiMatpel = function (datas) {
        return $http.post(api + 'detail_nilai', datas);
    };
    
    data.GetSubmitQuestions = function (datas) {
        return $http.post(api + 'submit_questions', datas);
    };

    data.GetDataProfile = function (datas) {
        return $http.post(api + 'profile', datas);
    };

    return data;
})




