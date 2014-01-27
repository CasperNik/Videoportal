app = angular.module("Videoportal", ["ngResource"])

app.factory('films', function($resource){
    "use strict";
    return $resource('/films/:id.json', {id: "@id"});
});

app.directive("dialog", function () {
    return {
        template: "<div class='dialog slide-animate-container' ng-transclude></div>",
        replace: true,
        transclude: true,
        scope: {

        }
    }
})

function FilmsCtrl ($scope, films, $log){
    $scope.films = films.query();
    // $log.debug($scope.films);

    $scope.showDescription = function(id){
        var film = films.get({id:id});
        $scope.desc = film;
        $log.debug(film);


    }



};