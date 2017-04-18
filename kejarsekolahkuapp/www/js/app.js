var angularapp = angular.module('starter', [
    'ionic'
            
    , 'starter.controllers'
            
    , 'starter.factories'
            
    , 'starter.services'
            
    , 'starter.constant'
            
    , 'angular-md5'
            
    , 'ngStorage'
            
    , 'angular-jwt'
            
    , 'pdf'
            
    , 'youtube-embed'
            
    , 'ngYoutubeEmbed'
]);

angularapp.run(function ($ionicPlatform) {
    $ionicPlatform.ready(function () {
        // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
        // for form inputs)
        if (window.cordova && window.cordova.plugins.Keyboard) {
            cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
            cordova.plugins.Keyboard.disableScroll(true);

        }
        if (window.StatusBar) {
            // org.apache.cordova.statusbar required
            StatusBar.styleDefault();
        }
    });
})

angularapp.config(function ($stateProvider, $urlRouterProvider) {
    $stateProvider

        .state('app', {
        url: '/app'
        , abstract: true
        , templateUrl: 'templates/front.html'
        , controller: 'AppCtrl'
    })

    .state('app.front', {
        url: '/front'
        , views: {
            'menuContent': {
                templateUrl: 'templates/title.html'
            }
        }
    })

    .state('home', {
        url: '/home'
        , abstract: true
        , templateUrl: 'templates/home.html'
        , controller: 'DashboardController'
    })

    .state('home.dashboard', {
        url: '/dashboard'
        , views: {
            'Content': {
                templateUrl: 'templates/dashboard.html'
                , controller: 'DashboardController'
            }
        }
    , })

    .state('home.packages', {
        url: '/packages'
        , views: {
            'Content': {
                templateUrl: 'templates/packages.html'
                , controller: 'PackagesController'
            }
        }
    , })

    .state('home.matpel', {
        url: '/matpel/:matpelId'
        , views: {
            'Content': {
                templateUrl: 'templates/matpel.html'
                , controller: 'MatpelController'
            }
        }
    , })

    .state('home.modul', {
        url: '/matpel/modul/:modulId'
        , views: {
            'Content': {
                templateUrl: 'templates/modul.html'
                , controller: 'ModulController'
            }
        }
    , })

    .state('home.modul_doc', {
        url: '/matpel/modul/doc/:modulId'
        , views: {
            'Content': {
                templateUrl: 'templates/modul_doc.html'
                , controller: 'ModulController'
            }
        }
    , })

    .state('home.modul_video', {
        url: '/matpel/modul/video/:modulId'
        , views: {
            'Content': {
                templateUrl: 'templates/modul_video.html'
                , controller: 'ModulController'
            }
        }
    , })

    .state('home.modul_soal', {
        url: '/matpel/modul/soal/:modulId'
        , views: {
            'Content': {
                templateUrl: 'templates/modul_soal.html'
                , controller: 'ModulController'
            }
        }
    , })

    .state('home.nilai', {
        url: '/nilai'
        , views: {
            'Content': {
                templateUrl: 'templates/nilai.html'
                , controller: 'NilaiController'
            }
        }
    , })

    .state('home.nilai_matpel', {
        url: '/nilai_detail/:matpelId'
        , views: {
            'Content': {
                templateUrl: 'templates/nilai_detail.html'
                , controller: 'DetailNilaiController'
            }
        }
    , })

    .state('home.profile', {
        url: '/profile'
        , views: {
            'Content': {
                templateUrl: 'templates/profile.html'
                , controller: 'ProfileController'
            }
        }
    , })




    // if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise('/app/front');
});

//angularapp.config(function($sceDelegateProvider) 
//{
//    $sceDelegateProvider.resourceUrlWhitelist(['self', new RegExp('^(http[s]?):\/\/(w{3}.)?youtube\.com/.+$')]);
//})