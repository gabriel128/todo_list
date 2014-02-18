ProjectGabriel::Application.routes.draw do

  root 'todo_list#index', as: 'todo_list', via: :all

  resources :task, except: [:show] do
    patch 'update_done', on: :member
  end

  resources :users

  get "todo_list/add_task/:id", to: 'todo_list#add_task', as: 'add_task'
  get "todo_list/order_by/:property", to: 'todo_list#order_by', as: 'order_by'

  controller :session do
    get 'login', to: :new
    post 'login', to: :create
    delete 'logout', to: :destroy
  end

  post 'todo_rest/authorize_user/.:format', to: 'todo_rest#authorize_user'

  #get "todo_list/index/:id" => 'todo_list#index'
  #get "todo_list/destroy"
  #get "todo_list/edit"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end                                                                                              asdfasd
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
