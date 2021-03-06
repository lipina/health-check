Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  resources :votes

  resources :statistics do
    # member do
    # end
    collection do
      get 'data', :defaults => { :format => 'json' }
    end
  end

  # GET /statistics/:id

  # get 'statistics/index' 

  resources :organizations do
    resources :surveys
    resources :teams
    resources :questions
  end

  get 'signup' => "organizations#new", as: "signup"
  
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'login' => "sessions#new", as: "login"
  delete 'logout' => "sessions#destroy", as: "logout" 

end
