/**
 * Created with JetBrains RubyMine.
 * User: saasbook
 * Date: 11/1/13
 * Time: 11:30 AM
 * To change this template use File | Settings | File Templates.
 */

app = angular.module("NACLA", ["ngResource"])


function CreateCoursePackCtrl($scope,$resource){
    $scope.title = '';
    $scope.summary = '';
    $scope.error = ''
    $scope.all_articles = $resource('all_articles').query() ;
    $scope.selected_articles = [];
    $scope.search_input = '';


    $scope.add_to_selected = function(article){
        if($scope.selected_articles.indexOf(article) == -1)
            $scope.selected_articles.push(article);

    };

    $scope.cancel = function(){
        window.location = '/';
    };

    $scope.remove_selected = function(article){
        $scope.selected_articles.splice($scope.selected_articles.indexOf(article),1);
    };

    $scope.submit = function(){
        if ($scope.title.length == 0 || $scope.summary.length == 0){
            $scope.error = 'You must assign a title and summary'
        }
        else{
            var article_ids = [];
            angular.forEach($scope.selected_articles, function(article){
                article_ids.push(article.id);
            })
            $resource('create').save({title:$scope.title, summary:$scope.summary, article_ids:article_ids},
                //Success
                function(){
                    window.location = '/'
                },
                //Failure
                function(){$scope.error = 'The course pack could not be saved'}) ;
        }
    }




}
function SearchCtrl($scope, $resource){

}