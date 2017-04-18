var angularapp = angular.module('myApp',
        [
            'ngRoute',
            'ngAnimate',
            'toastr',
            'angular-md5',
            'ngTable',
            'ngStorage',
            'angular-jwt',
            'ui.bootstrap',
            'pdf',
            'jkuri.datepicker',
            'youtube-embed',
            'ngSanitize',
            'angular-loading-bar'
        ]);


//Aplication Route
angularapp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider
//                ROUTE FOR MAIN
                .when('/', {
                    templateUrl: 'app/main/view/index.html'
                })

//                ROUTE FOR SISWA
                .when('/siswa/login', {
                    templateUrl: 'app/siswa/view/login.html',
                    controller: 'siswaLoginController'
                })
                .when('/siswa/dashboard', {
                    templateUrl: 'app/siswa/view/dashboard.html',
                    controller: 'siswaDashboardController'
                })

                .when('/siswa/paket-pembelajaran', {
                    templateUrl: 'app/siswa/view/paket-pembelajaran.html',
                    controller: 'siswaPaketPembelajaranController'
                })
                .when('/siswa/matpel/:idmatpel', {
                    templateUrl: 'app/siswa/view/detail-matpel.html',
                    controller: 'siswaDetailMatpelController'
                })
                .when('/siswa/modul/:idmodul', {
                    templateUrl: 'app/siswa/view/detail-modul.html',
                    controller: 'siswaDetailModulController'
                })
                .when('/siswa/logout', {
                    templateUrl: 'app/siswa/view/login.html',
                    controller: 'siswaLogoutController'
                })
                .when('/siswa/profile', {
                    templateUrl: 'app/siswa/view/profile.html',
                    controller: 'siswaProfileController'
                })

                .when('/siswa/upload', {
                    templateUrl: 'app/siswa/view/upload.html',
                    controller: 'siswaProfileController'
                })

                .otherwise({
                    redirectTo: '/'
                });
    }
]);

angularapp.config(['cfpLoadingBarProvider', function (cfpLoadingBarProvider) {
        
        cfpLoadingBarProvider.includeSpinner = false;
    }]);




