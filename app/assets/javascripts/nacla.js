/**
 * Created with JetBrains RubyMine.
 * User: saasbook
 * Date: 11/1/13
 * Time: 11:30 AM
 * To change this template use File | Settings | File Templates.
 */

app = angular.module("NACLA", ["ngResource"])

app.filter('input_filter', function()
{
    return function(input, search_term, title_flag, description_flag, 
        summary_flag, articles_flag, coursepacks_flag)
    {
        filtered_result = [];

        if (isNullOrUndefined(articles_flag))
        {
            articles_flag = true;
        }

        if (isNullOrUndefined(coursepacks_flag))
        {
            coursepacks_flag = false;
        }
        
        if (search_term.length > 0)
        { 
            var search_exp = new RegExp(search_term, "i");

            angular.forEach(input, function(e) 
            {
                if (coursepacks_flag && ('summary' in e))
                {
                    if ( (title_flag && search_exp.test(e.title)) || 
                         (summary_flag && search_exp.test(e.summary)) )
                    {
                        filtered_result.push(e);
                    }
                }
                else if (articles_flag && ("description" in e))
                {
                    if ( (title_flag && search_exp.test(e.title)) || 
                         (description_flag && search_exp.test(e.description)) )
                    {
                        filtered_result.push(e);
                    }
                }
            });
        }
        return filtered_result;
    };
});

function isNullOrUndefined(value)
{
    return (typeof value === "undefined" || value === null);
}

function CreateCoursePackCtrl($scope,$resource){
    $scope.title = '';
    $scope.summary = '';
    $scope.error = ''
    $scope.selected_articles = [];
    $scope.search_input = "";
    $scope.modal = {title:"",description:"",volume:"",issue:"",publication_date:"",tags:"",thumbnail_link:"",download_link:""};
    $scope.add_button = true;


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
    };

}
function SearchPartialCtrl($scope, $resource){

    $(function() {
        $("#modal").easyModal();
    });

    $scope.all_articles = $resource('/articles/search').query();

    $scope.open_modal = function(article){
        $scope.modal = article;
        $("#modal").trigger('openModal');
    }

    $scope.close_modal = function(){
//        $scope.modal = "";
        $("#modal").trigger('closeModal');
    }

}

function SearchCtrl($scope, $resource){

    $scope.search_input = "";
    $scope.all_coursepacks = $resource('/course_packs/search').query();
}

