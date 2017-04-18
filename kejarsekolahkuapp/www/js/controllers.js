var controllers = angular.module('starter.controllers', [])

controllers.controller('AppCtrl', function (
    $scope
    , $ionicModal
    , $timeout
    , md5
    , api
    , LoginFactory
    , jwtHelper
    , $localStorage
    , $state
    , TokenService
    , $ionicLoading
    , $ionicPopup
) {

    $scope.loginData = {};
    token = JSON.stringify($localStorage.token);
    if (token == undefined) {
        //        $location.path('/app/front');
        $state.go('app.front');
    } else {
        TokenService.checkToken(token);
        //        $location.path('/home/dashboard');
        $state.go('home.dashboard');
    }

    // Create the login modal that we will use later
    $ionicModal.fromTemplateUrl('templates/login.html', {
        scope: $scope
    }).then(function (modal) {
        $scope.modal = modal;
    });

    // Triggered in the login modal to close it
    $scope.closeLogin = function () {
        $scope.modal.hide();
    };

    // Open the login modal
    $scope.login = function () {
        $scope.modal.show();
    };


    // Perform the login action when the user submits the login form
    $scope.doLogin = function () {

        input = {
            idsiswa: $scope.loginData.idsiswa
            , password: md5.createHash($scope.loginData.password)
        };
        //console.log(JSON.stringify(input));
        $ionicLoading.show();
        LoginFactory.getUserValidLogin(input).success(function (response) {
            var token = jwtHelper.decodeToken(response);
            if (token.response == "OK") {
                dataAuth = {
                    token: response
                };
                $localStorage.token = dataAuth;
                setTimeout(function () {
                    $state.go('home.dashboard');
                    $ionicLoading.hide();
                }, 1000);
            } else {

                var alertPopup = $ionicPopup.alert({
                    title: 'Peringantan'
                    , template: 'ID dan password salah !'
                });

                alertPopup.then(function (res) {
                    console.log('login gagal');
                });
            };
            //console.log("Login Gagal");
            //                ionicToast.show('This is a toast at the top.', 'top', true, 2000);
        });
        $ionicLoading.hide();

        // Simulate a login delay. Remove this and replace with your login
        // code if using a login system
        $timeout(function () {
            $scope.closeLogin();
        }, 1000);
    };
})


controllers.controller('DashboardController', function (
    TokenService
    , $scope
    , $localStorage
    , $state
    , jwtHelper
    , SiswaFactory
    , $ionicLoading
    , $ionicPopup
) {
    $scope.isExpanded = false;
    $scope.logout = function () {
        var confirmPopup = $ionicPopup.confirm({
            title: "Konfirmasi"
            , template: 'Anda yakin keluar ?'
        });

        confirmPopup.then(function (res) {
            if (res) {
                $ionicLoading.show();
                delete $localStorage.token;
                $state.go('app.front');
            }
            $ionicLoading.hide();
        });
    };
    var token = JSON.stringify($localStorage.token);
    TokenService.checkToken(token);
    var decode = jwtHelper.decodeToken(token);
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
    };
    console.log(JSON.stringify(data));
    $ionicLoading.show();
    SiswaFactory.GetDataDashboard(data).success(function (response) {
        $scope.output = response;
        $ionicLoading.hide();
        //        $scope.output.detail_matpel = $scope.output.detail_matpel[0];
        console.log(JSON.stringify(response));
    })

});

controllers.controller('PackagesController', function (
    TokenService
    , $scope
    , $localStorage
    , jwtHelper
    , SiswaFactory
    , $ionicLoading
) {
    token = JSON.stringify($localStorage.token);
    TokenService.checkToken(token);
    decode = jwtHelper.decodeToken(token);
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
    };
    $ionicLoading.show();
    SiswaFactory.GetDataPackages(data).success(function (response) {
        $scope.output = response;
        $ionicLoading.hide();
        //        console.log(JSON.stringify(response));
    })
});


controllers.controller('MatpelController', function (
    TokenService
    , $scope
    , $localStorage
    , jwtHelper
    , SiswaFactory
    , $stateParams
    , $ionicLoading
) {
    token = JSON.stringify($localStorage.token);
    TokenService.checkToken(token);
    decode = jwtHelper.decodeToken(token);
    params = $stateParams.matpelId;
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
        , "id_matpel": params
    };
    $ionicLoading.show();
    SiswaFactory.GetDataMatpel(data).success(function (response) {
        $scope.output = response;
        $ionicLoading.hide();
        //        console.log(JSON.stringify(response));
    });
    $ionicLoading.hide();

});

controllers.controller('ModulController', function (
    TokenService
    , $scope
    , $rootScope
    , $localStorage
    , jwtHelper
    , $stateParams
    , SiswaFactory
    , $ionicLoading
    , $ionicModal
    , $ionicPopup
    , $state
) {
    token = JSON.stringify($localStorage.token)
    TokenService.checkToken(token);
    decode = jwtHelper.decodeToken(token);
    params = $stateParams.modulId;
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
        , "id_modul": params
    };
    $ionicLoading.show();
    //    console.log(JSON.stringify(data));
    SiswaFactory.GetDataModul(data).success(function (response) {
        console.log(JSON.stringify(response));
        $scope.output = response.data;
        $scope.score_data = response.data.questions;
        //console.log($scope.score_data);
        if (response.data.video != "") {
            $scope.modulVideo = true;
            $scope.video = response.data.video + '&output=embed';
        } else {
            $scope.modulVideo = false;
        }
        // $scope.pagetitle = "Siswa - " + response.data.judul;
        if (response.data.filename != '') {
            $scope.modulPDF = true;
            $scope.pdfName = response.data.judul;
            $scope.pdfUrl = response.data.file;
            $scope.scroll = 0;
            $scope.loading = 'loading';

            $scope.getNavStyle = function (scroll) {
                if (scroll > 100)
                    return 'pdf-controls fixed';
                else
                    return 'pdf-controls';
            }
            $scope.Latihan = function ($scope, $timeout) {

                var amt = 66;
                $scope.countTo = amt;
                $scope.countFrom = 0;
                $timeout(function () {
                    $scope.progressValue = amt;
                }, 200);
            };
        } else {
            $scope.modulPDF = false;
        }
        $ionicLoading.hide();
    });
    $ionicModal.fromTemplateUrl('templates/modalnilai.html', {
        scope: $scope
    }).then(function (modal) {
        $scope.modal = modal;
    });

    // Triggered in the login modal to close it
    $scope.closeModal = function () {
        $scope.modal.hide();
        //        $state.reload();
        $state.go('home.modul', {
            modulId: params
        });
    };

    // Open the login modal
    $scope.openModal = function () {
        $scope.modal.show();
    };
    $scope.submitQuestions = function () {
        var confirmSubmitPopup = $ionicPopup.confirm({
            title: "Konfirmasi"
            , template: 'Anda yakin ?'
        });
        confirmSubmitPopup.then(function (res) {
            if (res) {
                $ionicLoading.show();
                var data_input = [];
                angular.forEach($scope.output.soal, function (value, key) {
                    if (value.jawab == undefined) {
                        value.jawab = 'N';
                    }
                    data_input.push({
                        id_soal: value.id_soal_modul
                        , jawaban: value.jawab
                    });
                });
                datas = {
                    "token": $localStorage.token.token
                    , "id_siswa": decode.data.id_siswa
                    , "id_modul": params
                    , "data_input": data_input
                };
                console.log(JSON.stringify(datas));
                SiswaFactory.GetSubmitQuestions(datas).success(function (response) {
                    //                    console.log(JSON.stringify(response));    
                    if (response.response === "OK") {
                        $scope.score_data = response.data;
                        $scope.openModal();
                    } else {
                        alert("Terjadi kesalahan");
                    }
                    $ionicLoading.hide();
                });
            }
        });
    };

});

controllers.controller('NilaiController', function (
    TokenService
    , $scope
    , $localStorage
    , jwtHelper
    , SiswaFactory
    , $ionicLoading
) {
    token = JSON.stringify($localStorage.token);
    TokenService.checkToken(token);
    decode = jwtHelper.decodeToken(token);
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
    };
    $ionicLoading.show();
    SiswaFactory.GetDataNilai(data).success(function (response) {
        $scope.output = response.data;
        $ionicLoading.hide();
        console.log(JSON.stringify(response));
    })
});

controllers.controller('DetailNilaiController', function (
    TokenService
    , $scope
    , $localStorage
    , jwtHelper
    , SiswaFactory
    , $ionicLoading
    , $stateParams
) {
    token = JSON.stringify($localStorage.token);
    TokenService.checkToken(token);
    decode = jwtHelper.decodeToken(token);
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
        , "id_matpel": $stateParams.matpelId
    };
    $ionicLoading.show();
    console.log(JSON.stringify(data));
    SiswaFactory.GetDetailNilaiMatpel(data).success(function (response) {
        $scope.output = response.data;
        $ionicLoading.hide();
        console.log(JSON.stringify(response));
    })
});

controllers.controller('ProfileController', function (
    TokenService
    , $scope
    , $localStorage
    , jwtHelper
    , SiswaFactory
    , $ionicLoading
) {
    token = JSON.stringify($localStorage.token);
    TokenService.checkToken(token);
    decode = jwtHelper.decodeToken(token);
    data = {
        "token": $localStorage.token.token
        , "id_siswa": decode.data.id_siswa
    };
    $ionicLoading.show();
    SiswaFactory.GetDataProfile(data).success(function (response) {
        $scope.output = response;
        console.log(JSON.stringify(response));
        $scope.options_gender = ['Pria', 'Wanita'];
        $scope.output.profil.kelamin_siswa = $scope.output.profil.kelamin_siswa;
        $scope.options_agama = ['Islam', 'Kristen/Katolik', 'Hindu', 'Budha'];
        $scope.output.profil.agama_siswa = $scope.output.profil.agama_siswa;
        $scope.options_tingkatan_sekolah = ['SD', 'SMP', 'Lain-Lain'];
        $scope.output.profil.pdkn_siswa = $scope.output.profil.pdkn_siswa;
        $ionicLoading.hide();
    })

})