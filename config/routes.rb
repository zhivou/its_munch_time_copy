Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api do
      resources :users
      resources :restaurants
      resources :orders
      
      get 'users/:id/orders', to: 'users#userhistory'
      get 'restaurant_history', to: 'orders#restaurant_history'
      get 'restaurant_visit_counter', to: 'orders#restaurant_visit_counter'
      get 'current_orders', to: 'orders#current_orders'
      get 'user_history', to: 'orders#user_history'
      get 'user_history_last_five', to: 'orders#user_history_last_five'
      put 'current_to_false', to: 'orders#current_to_false'
      get 'check_current_order', to: 'orders#check_current_order'
      delete 'delete_orders', to: 'orders#delete_orders'
      post 'add_person_to_order', to: 'orders#add_person_to_order'
      get 'users_not_in_order', to: 'users#users_not_in_order'
  end

  get '*other', to: 'static#index'
  
end
