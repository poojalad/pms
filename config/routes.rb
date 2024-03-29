PmsProject::Application.routes.draw do

  resources :users
	resources :projects do
		collection do
			get "search",:as=>"search_project"
		end
		resources :tasks do
			collection do 
				get "search",:as=>"search_task"
			end
		end
	end


#  match "/projects/search" => "projects#search", :as=>"search_project"
#  match "/projects/result" =>"projects#result",:as=>"result_project"
#  
#  match "/tasks/:id"=>"tasks#index", :as=>"tasks"
#  match "/tasks/:id/new"=>"tasks#new",:as=>"new_task"
#  match "/tasks/:id/create" =>"tasks#create",:as=>"create_task"
#  match "/tasks/:tid/:pid/edit" =>"tasks#edit",:as=>"edit_task"
#  match "/tasks/:tid/:pid/update" =>"tasks#update",:method=>:put,:as=>"update_task"
#  match "/tasks/:tid/:pid/show" =>"tasks#show", :as=>"show_task"
#  match "/tasks/:tid/:pid/destroy" =>"tasks#destroy",:as=>"destroy_task"
#  match "/tasks/:id/search" => "tasks#search", :as=>"search_task"
#  match "/tasks/:id/result" =>"tasks#result",:as=>"result_task"
  

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
