Rails.application.routes.draw do
  #visitors#index is for devise - This should be able to be deleted. No longer in use.
  root to: 'visitors#index' 

  devise_for :users
  resources :users do
    # I moved these routes in here to be nested
    # however, the routes shouldn't be named according to the API the data comes from
    # they need to be named for the resources themselves: ie: bank_charges, credit_charges.
    resources :plaid, except: [:show, :index]
    resources :stripe
  end
  
  # CHARITIES
  patch '/charities/:id/users/:id/update' => 'charities#update', as: :update_charities_users
  get '/charities/:id/users/:id/index' => 'charities#index', as: :charities_users

  #DONATIONS GRAPH: This needs to be reorganized, it shouldn't be under plaid.
  # It should be under a users or transactions controller
  get 'plaid/donations_graph' => 'plaid#donations_graph'

  #SETTINGS: These routes track user progress through initial sign up
  # The unfinished signup controller should go under user controller.
  get '/settings/unfinished_signup' => 'settings#unfinished_signup'

end
