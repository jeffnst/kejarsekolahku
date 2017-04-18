var services = angular.module('starter.services', []);

services.service('TokenService', function ($localStorage, $state, TokenFactory) {
    this.checkToken = function (token) {
        if (token == null) {
            console.log("No Token");
            $state.go('app.front');
        } else {
            TokenFactory.checkToken(token).success(function (response) {
                res = response.response;
                if (res == "FAIL") {
                    console.log(response.message);
                    $state.go('app.front');
                } 
            })
        }
    }
})

