/* 
 * File ini adalah file base untuk controller siswa
 */

/* global reponse */

//CONTROLLER UNTUK DIRECTIVE SISWA

angularapp.controller('siswTopNavDirectiveController'
        , function (
            $rootScope
            , ProfileSiswaFactory
            , $localStorage
            , SiswaTokenService
            , jwtHelper
        ) {
            token = JSON.stringify($localStorage.token)
            SiswaTokenService.checkToken(token);
            decode = jwtHelper.decodeToken(token);
            data = {
                "token": $localStorage.token.token
                , "id_siswa": decode.data.id_siswa
            };
            ProfileSiswaFactory.getSiswaProfile(data).success(function (response) {
                $rootScope.topnavoutput = response.profil;
            })
        })
    ///

// CONTROLLER OPERASI
angularapp.controller('siswaLoginController'
    , function (
        $scope, $rootScope
        , $window, $route
        , toastr, loginSiswaFactory
        , $location, md5
        , $localStorage, jwtHelper
    ) {
        $scope.doLogin = function (inputdata) {
            input = {
                idsiswa: inputdata.id
                , password: md5.createHash(inputdata.password)
            };
            console.log(JSON.stringify(input));
            loginSiswaFactory.getUserValidLogin(input).success(function (response) {
                var token = jwtHelper.decodeToken(response);
                console.log(JSON.stringify(token));
                if (token.response == "OK") {
                    toastr.success("Selamat Datang");
                    dataAuth = {
                        token: response
                    };
                    $localStorage.token = dataAuth;
                    //console.log("Login Berhasil");
                    $location.path('/siswa/dashboard');
                } else {
                    toastr.error("Login Gagal");
                    //console.log("Failed Login");
                }
            });
        };
    });
angularapp.controller('siswaLogoutController'
    , function (
        $route
        , toastr
        , $location
        , $localStorage
    ) {
        delete $localStorage.token;
        $location.path('/siswa/login');
        toastr.success("Keluar");
    });
angularapp.controller('siswaDashboardController'
    , function (
        $scope, $rootScope
        , $window, $route
        , toastr, SiswaTokenService
        , $location
        , $localStorage, jwtHelper
        , DataSiswaFactory
    ) {

        $scope.navbarCollapsed = true;
        $scope.pagetitle = "Siswa - Dashboard";
        token = JSON.stringify($localStorage.token)
        SiswaTokenService.checkToken(token);
        decode = jwtHelper.decodeToken(token);
        data = {
            "token": $localStorage.token.token
            , "id_siswa": decode.data.id_siswa
        };
        DataSiswaFactory.getSiswaDashboard(data).success(function (response) {
            //console.log(JSON.stringify(response));
            $scope.output = response;
            $scope.active = "active";
        })

    });
angularapp.controller('siswaPaketPembelajaranController'
    , function (
        $scope, $rootScope
        , $window, $route
        , toastr, SiswaTokenService
        , $location
        , $localStorage, jwtHelper
        , PaketPembelajaranSiswaFactory
    ) {
        token = JSON.stringify($localStorage.token)
        SiswaTokenService.checkToken(token);
        decode = jwtHelper.decodeToken(token);
        data = {
            "token": $localStorage.token.token
            , "id_siswa": decode.data.id_siswa
        };
        PaketPembelajaranSiswaFactory.getPaketSiswa(data).success(function (response) {
            //console.log(JSON.stringify(response));
            $scope.output = response.data;
            $scope.pagetitle = "Paket Pembelajaran";
        })
    });
angularapp.controller('siswaDetailMatpelController'
    , function (
        $scope, $rootScope
        , $window, $route
        , toastr, SiswaTokenService
        , $location
        , $localStorage, jwtHelper
        , $routeParams
        , DetailMatpelSiswaFactory
    ) {
        $scope.navbarCollapsed = true;
        $scope.pagetitle = "Siswa - ";
        token = JSON.stringify($localStorage.token)
        SiswaTokenService.checkToken(token);
        decode = jwtHelper.decodeToken(token);
        params = $routeParams.idmatpel;
        data = {
            "token": $localStorage.token.token
            , "id_siswa": decode.data.id_siswa
            , "id_matpel": params
        };
        //                    //console.log(JSON.stringify(data));

        DetailMatpelSiswaFactory.getDetailMatpel(data).success(function (response) {
            //console.log(JSON.stringify(response));
            $scope.output = response.data;
            $scope.pagetitle = $scope.pagetitle + response.data.nama_matpel;

        })
    });
angularapp.controller('siswaDetailModulController'
    , function (
        $scope, $rootScope, toastr
        , SiswaTokenService, $routeParams
        , $localStorage, jwtHelper
        , DetailModulSiswaFactory, $http, $window, $sce
    ) {
        $scope.navbarCollapsed = true;
        token = JSON.stringify($localStorage.token)
        SiswaTokenService.checkToken(token);
        decode = jwtHelper.decodeToken(token);
        params = $routeParams.idmodul;
        data = {
            "token": $localStorage.token.token
            , "id_siswa": decode.data.id_siswa
            , "id_modul": params
        };
        //console.log(JSON.stringify(data));
        DetailModulSiswaFactory.getModulMatpel(data).success(function (response) {
            //console.log(JSON.stringify(response));
            $scope.output = response.data;
            if (response.data.video != '') {
                $scope.modulVideo = true;
            }
            $scope.pagetitle = "Siswa - " + response.data.judul;
            if (response.data.file != '') {
                $scope.modulPDF = true;
                $scope.pdfName = response.data.judul;
                //                    $scope.pdfUrl = response.file;
                $scope.scroll = 0;
                $scope.loading = 'loading';
                $http.get(response.data.file, {
                    responseType: 'arraybuffer'
                }).success(function (resp) {
                    var file = new Blob([resp], {
                        type: 'application/pdf'
                    });
                    var fileURL = URL.createObjectURL(file);
                    $scope.pdfUrl = URL.createObjectURL(file);
                })
                $scope.getNavStyle = function (scroll) {
                    if (scroll > 100)
                        return 'pdf-controls fixed';
                    else
                        return 'pdf-controls';
                }
                if (response.data.soal != "") {
                    $scope.soalData = response.data.soal;
                    //                        //console.log(response.data.soal);s
                }
                $scope.Latihan = function ($scope, $timeout) {
                    var amt = 66;
                    $scope.countTo = amt;
                    $scope.countFrom = 0;
                    $timeout(function () {
                        $scope.progressValue = amt;
                    }, 200);
                };
            };
        });

        $scope.SubmitConfirm = function () {
            var confirmalert = confirm("Anda sudah yakin dengan jawaban anda ? ");
            if (confirmalert == true) {
                //console.log(true);
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
                //console.log(JSON.stringify(datas));

                DetailModulSiswaFactory.GetSubmitQuestions(datas).success(function (response) {
                    //console.log(JSON.stringify(response));
                    if (response.response === "OK") {
                        $scope.output.questions = response.data;
                        toastr.success("Sukses");
                    } else {
                        toastr.warning("Terjadi Kesalahan");
                    }

                });
            } else {
                //console.log(false);
            }
        }


    });
angularapp.controller('siswaProfileController'
    , function (
        $scope, $rootScope
        , $window, $route
        , toastr, SiswaTokenService
        , $location
        , $localStorage, jwtHelper
        , ProfileSiswaFactory, fileUpload
        , SiswaFileUploadFactory
    ) {

        $scope.navbarCollapsed = true;
        $scope.pagetitle = "Siswa - Profile";
        token = JSON.stringify($localStorage.token)
        SiswaTokenService.checkToken(token);
        decode = jwtHelper.decodeToken(token);
        data = {
            "token": $localStorage.token.token
            , "id_siswa": decode.data.id_siswa
        };
        ProfileSiswaFactory.getSiswaProfile(data).success(function (response) {
            //console.log(JSON.stringify(response));
            $scope.output = response;
            $scope.jnsklm = ['Pria', 'Wanita'];
            $scope.output.profil.kelamin_siswa = $scope.output.profil.kelamin_siswa;
            $scope.options_agama = ['Islam', 'Kristen/Katolik', 'Hindu', 'Budha'];
            $scope.output.profil.agama_siswa = $scope.output.profil.agama_siswa;
            $scope.options_tingkatan_sekolah = ['SD', 'SMP', 'Lain-Lain'];
            $scope.output.profil.pdkn_siswa = $scope.output.profil.pdkn_siswa;
            $scope.active = "active";
        });
        $scope.leftShow = true;
        $scope.midShow = false;
        $scope.rightShow = false;
        $scope.leftBtn = function () {
            $scope.leftShow = !$scope.leftShow;
            $scope.rightShow = false;
            $scope.midShow = false;
        }
        $scope.rightBtn = function () {
            $scope.leftShow = false;
            $scope.rightShow = !$scope.rightShow;
            $scope.midShow = false;
        }
        $scope.midBtn = function () {
            $scope.leftShow = false;
            $scope.rightShow = false;
            $scope.midShow = !$scope.midShow;
        }

        $scope.saveProfile = function () {
            token = JSON.stringify($localStorage.token);
            SiswaTokenService.checkToken(token);
            decode = jwtHelper.decodeToken(token);
            data_input = {
                "nama_siswa": $scope.output.profil.nama_siswa
                , "kelamin_siswa": $scope.output.profil.kelamin_siswa
                , "tmp_lhr_siswa": $scope.output.profil.tmp_lhr_siswa
                , "tgl_lhr_siswa": $scope.output.profil.tgl_lhr_siswa
                , "agama_siswa": $scope.output.profil.agama_siswa
                , "alamat_siswa": $scope.output.profil.alamat_siswa
                , "kontak_siswa": $scope.output.profil.kontak_siswa
                , "ortu_siswa": $scope.output.profil.ortu_siswa
            , };
            datas = {
                "token": $localStorage.token.token
                , "id_siswa": decode.data.id_siswa
                , "data_input": data_input
                , "action": '1'
            };
            console.log(JSON.stringify(datas));
            ProfileSiswaFactory.SaveSiswaProfile(datas).success(function (response) {
                if (response.response == "OK") {
                    toastr.success(response.message);
                } else {
                    toastr.warning(response.message);
                }
                //                    //console.log(response.response);
            });
        }
        $scope.savePendidikan = function () {
            token = JSON.stringify($localStorage.token)
            SiswaTokenService.checkToken(token);
            decode = jwtHelper.decodeToken(token);

            data_input = {
                "pdkn_siswa": $scope.output.profil.pdkn_siswa
                , "nama_sekolah_siswa": $scope.output.profil.nama_sekolah_siswa
                , "thn_lulus_siswa": $scope.output.profil.thn_lulus_siswa
                , "no_ijasah_siswa": $scope.output.profil.no_ijasah_siswa
                , "no_skhun_siswa": $scope.output.profil.no_skhun_siswa
            };
            datas = {
                "token": $localStorage.token.token
                , "id_siswa": decode.data.id_siswa
                , "data_input": data_input
                , "action": '2'
            };

            console.log(JSON.stringify(datas));
            ProfileSiswaFactory.SaveSiswaProfile(datas).success(function (response) {
                if (response.response == "OK") {
                    toastr.success(response.message);
                } else {
                    toastr.warning(response.message);
                    //
                }
            });

            var ijazahFile = $scope.ijazahImg;
            var skhunFile = $scope.skhunImg;
            console.log(ijazahFile);
            if (ijazahFile != undefined) {
                fileUpload.uploadFileToUrl(ijazahFile, '1').success(function (response) {
                    if (response.response == 'OK') {
                        var ijazahimgname = response.filename;
                        data_input = {
                            "ijazahimgname": ijazahimgname
                        , }
                        datas = {
                            "token": $localStorage.token.token
                            , "id_siswa": decode.data.id_siswa
                            , "data_input": data_input
                            , "action": '4'
                        };
                        ProfileSiswaFactory.SaveSiswaProfile(datas).success(function (response) {
                            if (response.response == "OK") {
                                toastr.success(response.message);
                                $scope.ijazahImg = '';
                            } else {
                                toastr.warning(response.message);
                                //console.log(JSON.stringify(response))
                            }
                        });
                    } else {
                        toastr.warning(response.message);
                        //console.log(JSON.stringify(response));
                    }
                });

                $scope.ijazahImg = '';
                var ijazahFileName = $localStorage.ijazahImgName;
            } else {
                var ijazahFileName = $scope.output.profil.foto_ijazah_siswa;
            }

            if (skhunFile != undefined) {
                fileUpload.uploadFileToUrl(skhunFile, '2').success(function (response) {
                    if (response.response == 'OK') {
                        var skhunimgname = response.filename;
                        data_input = {
                            "skhunimgname": skhunimgname
                        , }
                        datas = {
                            "token": $localStorage.token.token
                            , "id_siswa": decode.data.id_siswa
                            , "data_input": data_input
                            , "action": '5'
                        };
                        ProfileSiswaFactory.SaveSiswaProfile(datas).success(function (response) {
                            if (response.response == "OK") {
                                toastr.success(response.message);
                                $scope.skhunImg = '';
                            } else {
                                toastr.warning(response.message);
                                //console.log(JSON.stringify(response))
                            }
                        });
                    } else {
                        toastr.warning(response.message);
                        //console.log(JSON.stringify(response));
                    }
                });
                $scope.skhunImg = '';
            } else {
                var skhunFileName = $scope.output.profil.foto_skhun_siswa;
            }
        };
        $scope.toggleAnimation = function () {
            $scope.animationsEnabled = !$scope.animationsEnabled;
        };
    }

);
//angularapp.controller('siswaPaketPembelajaranController',
//        function (
//                $scope, $rootScope,
//                $window, $route,
//                toastr, SiswaTokenService,
//                $location,
//                $localStorage, jwtHelper,
//                PaketPembelajaranSiswaFactory
//                )
//        {
//            token = JSON.stringify($localStorage.token)
//            SiswaTokenService.checkToken(token);
//            decode = jwtHelper.decodeToken(token);
//            data = {
//                "token": $localStorage.token.token,
//                "id_siswa": decode.data.id_siswa
//            };
//            PaketPembelajaranSiswaFactory.getPaketSiswa(data).success(function (response) {
//                //console.log(response);
//                $scope.output = response;
//                $scope.isCollapsed = false;
//            })
//        });