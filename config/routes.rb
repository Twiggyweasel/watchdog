Rails.application.routes.draw do
  
  
  root 'logins#new'
  
  resources :people
  resources :users
  # Boarding Routes
    #Main Page
      get 'index' => 'pages#index'
      get 'active' => 'pages#active'
      get 'archive' => 'pages#archive'
      get 'property' => 'pages#property_public'
      get 'admin' => 'pages#admin'
        #Subdirectory
          get 'information' => 'pages#information_public'
          get 'events' => 'pages#events_public'
          get 'security' => 'pages#security_public'
          get 'directory' => 'pages#directory_public'
  # Admin Routes
  get 'records_admin' => 'pages#records_manager'
  get 'property_admin' => 'pages#property_index'
  get 'user_admin' => 'users#index'
    #Subdirectory
      get 'events_manager' => 'pages#events'
      get 'property_manager' => 'pages#property'
      get 'department_manager' => 'pages#security'
      get 'directory_manager' => 'pages#directory'
      get 'user_edit' => 'users#edit'
      get 'user_create' => 'users#new'
  # Authenticate
  get '/login', to: "logins#new"
  post '/login', to: "logins#create"
  get '/logout', to: "logins#destroy"
  
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
  #     end
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
