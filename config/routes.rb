Rails.application.routes.draw do
  
  
  get 'example/show'

  root 'logins#new'

  resources :people
  resources :users
  resources :listings
  resources :departments
  resources :clearances
  resources :events
  resources :constructions
  resources :tips
  resources :hours
  resources :incidents
  resources :contypes

  # Boarding Routes
    #Main Page
      get 'index' => 'pages#index'
      get 'active' => 'pages#active'
      get 'archive' => 'pages#archive'
      get 'security' => 'pages#security'
      get 'property' => 'pages#property'
      get 'admin_home' => 'pages#admin'
      get 'parking' => 'pages#parking'
      get 'landf' => 'pages#landf'
      get 'dispatcher' => 'pages#dispatcher'
      get 'about' => 'pages#about'
        #Subdirectory
          get 'maps' => 'pages#maps'
          get 'venue' => 'pages#event'
          get 'directory' => 'pages#directory'
  # Admin Routes
  get 'property_admin' => 'admin#admin_property'
  get 'reference_admin' => 'admin#admin_references'
  get 'security_admin' => 'admin#admin_security'
  get 'logs_admin' => 'admin#admin_logs'
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
