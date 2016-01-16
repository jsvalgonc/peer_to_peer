Rails.application.routes.draw do
  
  resources :installments
  resources :installments
  resources :deals
  
  get '/application/close_month' => "application#close_month", as: 'admin_close_month'  
  get '/application/main_admin', :to => "application#main_admin", as: 'main_admin'
  get '/account_movements/list_investor/:investor_id', :to => "account_movements#list_investor", as: 'account_movements_list_investor'
  get 'investors/search'
  get '/entrepreneurs/main/:id', :to => "entrepreneurs#main", as: 'entrepreneur_main'
  get '/investors/:id/main', :to => "investors#main", as: 'investor_main'
  resources :projects
  get '/projects/index_investor/:investor_id', :to => "projects#index_investor", as:"index_investor"
  get '/deal/new_deal_investor_project/:id_investor/:id_project', :to => "deals#new_deal_investor_project", as:"new_deal_investor_project"
  get 'entrepreneurs/:user_id/new_by_user' => 'entrepreneurs#new_by_user', as: :entrepreneur_new_by_user
  post 'entrepreneurs/:user_id/create_by_user' => 'entrepreneurs#create_by_user', as: :entrepreneur_create_by_user
  get 'investors/:user_id/new_by_user' => 'investors#new_by_user', as: :investor_new_by_user
  post 'investors/:user_id/create_by_user' => 'investors#create_by_user', as: :investor_create_by_user


  resources :entrepreneurs do
    resources :projects
  end
  
  resources :investors do 
    resources :account_movements
  end
  
  resources :account_movements
  
  devise_scope :user do
    root to: "devise/sessions#new", :controllers => { registrations: 'registrations' }
  end

  #devise_for :users, :path_prefix => 'my' - comentado 22/11/2015 - implementação roles
  devise_for :users , :controllers => { registrations: 'registrations' }
  resources :users
  #JG 21/11/2015

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
