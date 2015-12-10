Rails.application.routes.draw do
  
  resources :deals
  resources :deals
  resources :projects
  resources :projects
  get '/application/main_admin', :to => "application#main_admin", as: 'main_admin'
  get '/account_movements/new_id/:id', :to => "account_movements#new_id", as: 'account_movements_id'
  get '/account_movements/list_investor/:id_investor', :to => "account_movements#list_investor", as: 'account_movements_list_investor'
  get 'investors/search'
  get '/entrepreneurs/main/:id', :to => "entrepreneurs#main", as: 'entrepreneur_main'
  get '/projects/new_by_entrepreneur/:id_entrepreneur', :to => "projects#new_by_entrepreneur", as:"project_new_by_entrepreneur"
  get '/projects/index_investor/:id_investor', :to => "projects#index_investor", as:"index_investor"
  get '/deal/new_deal_investor_project/:id_investor/:id_project', :to => "deals#new_deal_investor_project", as:"new_deal_investor_project"
  resources :entrepreneurs
  resources :account_movements
  resources :investors
  #authenticated :user do
  #  root to: "devise/sessions#new", :as => "authenticated_root"
  #end
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  #get 'home/index'
  #devise_for :users
  #root :to => "home#index"
  
  #devise_for :users, :path_prefix => 'my' - comentado 22/11/2015 - implementação roles
  devise_for :users
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
