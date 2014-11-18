BigFish::Application.routes.draw do

  resources :regions

  resources :service_data

  get "my_publications/:id" => "publications#user_publications", :as => :user_publications
  get "my_drafts/:id" => "publications#user_drafts", :as => :user_drafts
  get "my_ready/:id" => "publications#user_ready", :as => :user_ready
  get "my_rejected/:id" => "publications#user_rejected", :as => :user_rejected


  get 'by_category/:id' => "publications#by_category", :as => :publications_by_category
  get 'by_type/:id' => "publications#by_type", :as => :publications_by_type
  get 'by_region/:id' => "publications#by_region", :as => :publications_by_region

  get "page/:short_name" => "pages#short_name", :as => :page_by_short_name

  # get "parser/entities"
  # get "parser/events"
  # get "parser/regions"
  get "parser/import_all"

  devise_for :users

  resources :pages
  resources :entities
  resources :publication_attachments
  resources :publications

  root 'welcome#index'

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
