/**
 * Created with JetBrains RubyMine.
 * User: saasbook
 * Date: 11/1/13
 * Time: 11:30 AM
 * To change this template use File | Settings | File Templates.
 */

app = angular.module("NACLA", ["ngResource"])


function CreateCoursePackCtrl($scope,$resource){

    $scope.all_articles = $resource('all_articles').query() ;
    $scope.selected_articles = [];
    $scope.search_input = '';

    $scope.add_to_selected = function(article){
        if($scope.selected_articles.indexOf(article) == -1)
            $scope.selected_articles.push(article);

    };

    $scope.remove_selected = function(article){
        $scope.selected_articles.splice($scope.selected_articles.indexOf(article),1);
    };

    $scope.submit = function(){
        $resource('create').post({title:$scope.title, summary:$scope.summary}).success();
    }




}
