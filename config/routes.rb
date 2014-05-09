Glipster::Application.routes.draw do
  match 'login', to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete
  match 'signup', to: 'users#new', via: :get
  match 'reset_password', to: 'password_resets#new', via: :get
  match 'games/upload', to: 'games#upload', via: :get
  match 'games/:id/vote', to: 'games#vote', via: :post
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do 
    member do
      get 'confirm'
      get 'change_password'
      put 'update_password'
      get 'check_username'
    end
  end
  resources :categories
  match 'games/highest_rated', to: 'games#highest_rated', via: :get
  resources :games do
    member do
      post 'vote'
      get  'vote'
      get  'load_reputation'
      get  'load_comments'
      get  'most_played'
    end
  end
  resources :comments
  resources :password_resets
  resources :developers
  resources :featured_category_games
  match 'search/games', to: 'search#games', via: :get
  resources :search, only: :new
  match 'featured_images/update_position', to: 'featured_images#update_position', via: :put
  resources :featured_images, only: [:index, :create, :destroy]
  match 'contact_us', to: 'support_tickets#new', via: :get
  resources :support_tickets, only: [:index, :new, :create, :update]
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):

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
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
