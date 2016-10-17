Rails.application.routes.draw do

  # devise_for :users
  devise_for :models

  get '/todo' => 'home#todo'
  get 'messages/new/:id/:job_id'=> 'messages#new'
  # get '/jobs/:location/:proximity' => 'jobs#location'
  resources :job_types
  resources :business_types
  resources :jobs
  resources :profile
  resources :businesses
  # root 'home#index'
  get '/' => 'home#index'
  get '/about' => 'home#about'
  # users/registrations#destroy

  devise_for :users, :controllers => { :registrations => 'registrations' }
  # devise_for :users, :controllers => { :registrations => 'users/registrations' }

  namespace :api do
    resources :jobs
  end

  resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :reply
    post :restore
    post :mark_as_read
  end
  collection do
    delete :empty_trash
  end
end
resources :messages, only: [:new, :create]

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
