Rails.application.routes.draw do
  # lines 3 & 4 are for paypal if we use it.
  # get "/auth/paypal/callback", to: "sessions#create"
  # resource :session

  # devise_for and resources are for devise
  devise_for :users
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'sessions#index'
  root to: 'visitors#index' #this is for devise


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'plaid/new' => 'plaid#new'
  patch 'plaid/create' => 'plaid#create'
  get 'plaid/update' => 'plaid#edit'
  post 'plaid/update' => 'plaid#update'

  get 'stripe/new' => 'stripe#new'
  post 'stripe/create' => 'stripe#create'

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
