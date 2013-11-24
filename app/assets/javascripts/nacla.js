/**
 * Created with JetBrains RubyMine.
 * User: saasbook
 * Date: 11/1/13
 * Time: 11:30 AM
 * To change this template use File | Settings | File Templates.
 */
app = angular.module("NACLA", ["ngResource"])

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
        init: function($scope,form_inst){
            if($scope.course_pack){
            $scope.title = $scope.course_pack['title'];

            }
            else{
            $scope.title = '';
            $scope.summary = '';
            }
            $scope.selected_articles = [];

        }

    }
})

function CreateCoursePackCtrl($scope,$resource, Form){
    Form.init($scope,Form);
    $scope.error = ''  ;
    $scope.search_input = "";
    $scope.add_button = true;

    $scope.add_to_selected = function(article){
        if($scope.selected_articles.indexOf(article) == -1)
            $scope.selected_articles.push(article);

    };

    $scope.cancel = function(){
        window.location = '/course_packs';
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
            var user_id = $('#user_id').data('url');
            $.ajax({ url: '/course_packs/create',
                type: 'POST',
                beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                data: {"title":$scope.title, "summary":$scope.summary, "article_ids":article_ids, 'user_id':user_id},
                success: function(response) {
                    window.location = '/course_packs';
                }
            });
        }
    }

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

    $scope.search_input = {title:"",description:"",volume:"",issue:"",publication_date:"",tags:"",thumbnail_link:"",download_link:""};
    $scope.all_coursepacks = $resource('/course_packs/search').query();

} ;

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

function EditCoursePackCtrl($scope,Page,Form){
    Page.init($scope,Page);
    Form.init($scope,Form);

}





