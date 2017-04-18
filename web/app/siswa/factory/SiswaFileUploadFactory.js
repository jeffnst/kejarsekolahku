angularapp.factory('SiswaFileUploadFactory', function ($http) {
    var factory = {};
    //    var api = 'http://localhost/pkbmksi-web/api/v1/siswa/';
    var api = 'http://kejarsekolahku.hol.es/api/v1/siswa/';

    factory.uploadFile = function (fileDetail, datas) {
        console.log(fileDetail);
        return $http.post(api + 'file_upload', fileDetail, datas);
    };
    return factory;
});