/**
 * Created with JetBrains RubyMine.
 * User: saasbook
 * Date: 11/1/13
 * Time: 11:30 AM
 * To change this template use File | Settings | File Templates.
 */
app = angular.module("NACLA", ["ngResource"])
var articleIsExpanded = false;

function expandArticles(){
    var input = document.getElementById("search_input");
    var length = input.value.length;
    var articles = document.getElementById("articles");
    if(length > 0)
    {

        if(articles.offsetHeight > 0)
        {
            var left_content = document.getElementById("left_content");
            var left_height = left_content.height;
            var center_content = document.getElementById("center_content");
            var center_height = $("#footer").offset().top;
            var offset = $("#articles").offset().top;

            if(!articleIsExpanded)
            {
                $("#articles").css("height", center_height - offset - 60);
                articleIsExpanded = true;
            }
        }
    }
    else
    {
        $("#articles").css("height", "auto");
        articleIsExpanded = false;
    }
}

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
        
        if (!isNullOrUndefined(search_term) && search_term.length > 0)
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

app.factory('Page', function(){
    return{
        init: function($scope,page_inst){
            $scope.course_pack = page_inst.get_course_pack();
            $scope.articles = page_inst.get_articles();

        },
        get_course_pack: function(){
            return $('#course_pack_content').data('url');
        },
        get_articles:  function(){
            var articles_raw = $('#articles_content').data('url');
            var articles = [];
            angular.forEach(articles_raw, function(article){
                articles.push(angular.fromJson(article));
            });
            return articles;
        }

    }
});

app.factory('Modal', function(){
    return{
        init: function($scope,modal_inst,selector){
            $(selector).easyModal();

            $scope.open_modal = function(article){
                modal_inst.open($scope,article);
            };

            $scope.close_modal =function(){
                modal_inst.close();
            }
        },
        open: function($scope,article){
            $scope.modal = article;
            $("#show_article").trigger('openModal');
        },
        close: function(){
            //$scope.modal = "";
            $("#show_article").trigger('closeModal');
        }
    }
});

app.factory('Form', function(){
    return{
        init: function($scope,form_inst,page){
            if($scope.course_pack){
                $scope.title = $scope.course_pack['title'];
                $scope.summary = $scope.course_pack['summary'];
                $scope.form_button = 'Update'
                $scope.selected_articles = $scope.articles;
            }
            else{
                $scope.title = '';
                $scope.summary = '';
                $scope.form_button = 'Create'
                $scope.selected_articles = [];
            };
            $scope.cancel = function(){
                window.location = '/course_packs';
            };

            $scope.submit = function(){
                if ($scope.title.length == 0 || $scope.summary.length == 0){
                    $scope.error = 'You must assign a title and summary'
                }
                else{
                    var article_ids = [];
                    angular.forEach($scope.selected_articles, function(article){
                        article_ids.push(article.id);
                    });
                    var user_id = $('#user_id').data('url');

                    if($scope.course_pack){
                        var url = '/course_packs/update';
                        var data = {"article_ids":article_ids,"id":$scope.course_pack["id"],"course_pack":{"title":$scope.title, "summary":$scope.summary}};
                    }
                    else{
                        var url = '/course_packs/create';
                        var data = {"title":$scope.title, "summary":$scope.summary, "article_ids":article_ids, 'user_id':user_id};
                    }

                    $.ajax({ url: url,
                        type: 'POST',
                        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                        data: data,
                        success: function(response) {
                            window.location = '/course_packs';
                        }
                    });
                }
            };

        }
    }
});

function isNullOrUndefined(value)
{
    return (typeof value === "undefined" || value === null);
}

function CreateCoursePackCtrl($scope,$resource, Form,Page){
    Page.init($scope,Page);
    Form.init($scope,Form);
    $scope.error = ''  ;
    $scope.search_input = "";
    $scope.add_button = true;
    $scope.search_title = true;


    $scope.add_to_selected = function(article){
        if($scope.selected_articles.indexOf(article) == -1)
            $scope.selected_articles.push(article);

    };

    $scope.remove_selected = function(article){
        $scope.selected_articles.splice($scope.selected_articles.indexOf(article),1);
    };

}

function SearchPartialCtrl($scope, $resource, Modal){

    Modal.init($scope,Modal,"#show_article");

    $scope.all_articles = $resource('/articles/search').query(function(data){
        //with successful return, assign first element to modal
        //handles resizing issues, css is better alternative

        //checks to make sure array is not empty
        if(data.length > 0){
            $scope.modal = data[0];
        }
        return data;
    });

    $scope.dateFormatting = function(date){
        var formatted_date =  new Date(date);
        return formatted_date.toLocaleDateString();
    }

}

function SearchCtrl($scope, $resource){

    $scope.all_coursepacks = $resource('/course_packs/search').query();
    $scope.search_articles = true;
    $scope.search_coursepacks = true;
    $scope.search_title = true;
    $scope.search_description = true;
    $scope.search_summary = true;

};

function CoursePackShowCtrl($scope, $resource, Page, Modal){
    Page.init($scope,Page);
    Modal.init($scope,Modal,"#show_article");

    $scope.dateFormatting = function(date){
        var formatted_date =  new Date(date);
        return formatted_date.toLocaleDateString();
    }

};

function ModalCtrl($scope){


}

function CommentsCtrl($scope){
    $scope.comments = $('#comments').data('url');

    $scope.post = function(){
        $.ajax({ url: '/comments/create_comment',
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: {course_pack_id:$scope.course_pack.id,comment:$scope.comment_input},
            success: function(response) {
                  window.location = window.location;
                }
            })
        };
}

