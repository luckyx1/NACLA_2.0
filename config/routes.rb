NACLA::Application.routes.draw do
  get "articles/show"

  get "comments/show"
  get "comments/add"
  get "comments/delete"
  get "comments/" => "comments#index"
  post "comments/add"
  post "comments/delete" => "comments#delete"
  match "comments/create_comment" => "comments#create_comment"


  match 'articles/search' => 'articles#search'
  match 'articles/:id/download' => 'articles#download'
  match 'articles/:id' => 'articles#show'



  post 'new/list_all' => 'course_packs#list_all'
  post 'course_packs/new' => 'course_packs#add_article'
  match 'course_packs/create' => 'course_packs#create'
  get 'course_packs/all_articles' => 'course_packs#all_articles'
  match 'course_packs/search' => 'course_packs#search'
  post 'course_packs/update' => 'course_packs#update'


  resources :course_packs
  get 'user/usernames'=>'users#usernames'
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  post "log_in" => "sessions#create" 
  get "sign_up" => "users#new", :as => "sign_up"
  get "edit_user" => "users#edit", :as => "edit_user"
  post "edit_user" => "users#update"
  get "destroy_user/:id" => "users#destroy"
  match "user/profile" => "users#index"
  resources :users


  match "search" => "articles#search"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => 'course_packs#index'
  match 'home', :to => "static#index"
  root :to => "static#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
