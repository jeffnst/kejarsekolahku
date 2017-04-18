/* 
 * File ini adalah file base untuk service token siswa
 */

angularapp.service('SiswaTokenService', function ($location, SiswaTokenFactory, toastr, $localStorage) {
    this.checkToken = function (getDataAuth) {
        if (getDataAuth == null) {
            console.log("No Token");
            toastr.warning("Token kosong, login kembali !");
            $location.path('/siswa/login');
        } else {
            data = getDataAuth;
            checkToken = SiswaTokenFactory.checkToken(data).success(function (response) {
                res = response.response;
                if (res == "FAIL") {
                    console.log(response.message);
                    toastr.warning("Token kosong, login kembali !");
                    $location.path('/siswa/login');
                }
//                else{
//                    console.log(response);
//                }
            })
        }
    }
});
