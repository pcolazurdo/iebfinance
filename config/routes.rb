Rails.application.routes.draw do

  devise_for :users
  # get 'arqueo/calcular'
  #
  # get 'arqueo/imprimir'

  resources :arqueo do
    collection do
      get :calcular
      get :imprimir
      get :prev
      get :next
    end
  end

  resources :efectivos

  get '/', to: redirect('/movimientos')

  concern :list do
    get :list, on: :collection
  end

  resources :movimientos, concerns: [:list] do
    collection do
      get :list
    end
  end

  resources :ofrendas do
    collection do
      get :list
    end
  end

  #resources :cuentas
  resources :cuentas do
    # get :update_table => 'ofrendas#update_table', as: 'update_table'
    collection do
      get :list
    end
    member do
      get :list_movimientos
    end
  end

  resources :miembros

  resources :vales do
    member do
      get :rendir
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'movimientos#index'

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
