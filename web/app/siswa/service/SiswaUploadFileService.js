//angularapp.service('fileUpload', function ($http, toastr) {
//    var url = 'http://localhost/pkbmksi-web/api/v1/siswa/file_upload';
//    this.uploadFileToUrl = function (file, action) {
//        var fd = new FormData();
//        action_param = {"action": action};
//        fd.append('file', file);
//        data = {
//            transformRequest: angular.identity,
//            headers: {
//                'Content-Type': undefined,
//                'action': action
//            }
//        }
//        return $http.post(url, fd, data)
//    }
//});

angularapp.service('fileUpload', function (SiswaFileUploadFactory) {
    this.uploadFileToUrl = function (file, action) {
        var fileDetail = new FormData();
        fileDetail.append('file', file);
        data = {
            transformRequest: angular.identity
            , headers: {
                'Content-Type': undefined
                , 'action': action
            }
        }
        console.log(fileDetail);
        return SiswaFileUploadFactory.uploadFile(fileDetail, data);
    }
});