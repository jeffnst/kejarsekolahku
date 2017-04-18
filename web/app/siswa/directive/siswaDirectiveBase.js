angularapp.directive('siswaTopnavdirective', function(){
    return {
        restrict: 'E',
        templateUrl: 'app/siswa/view/navigation.html',
        controller: 'siswTopNavDirectiveController'
    };
})
angularapp.directive('siswaSidebardirective', function(){
    return {
        restrict: 'E',
        templateUrl: 'app/siswa/view/sidebar.html'        
    };
})

angularapp.directive('siswaFooterdirective', function(){
    return {
        restrict: 'E',
        templateUrl: 'app/siswa/view/footer.html'        
    };
})

angularapp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            console.log(model);
            console.log(modelSetter);
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
