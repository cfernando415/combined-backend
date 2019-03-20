Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :femmecubator do
    namespace :api do
      namespace :v1 do
        resources :members
        resources :coupons
        resources :events
        resources :like1s
        resources :plans
        get '/current_user', to: 'auth#show'
        post '/login', to: 'auth#create'
        post '/members/:id/wishlists', to: 'wishlists#create'
      end
    end
  end

  namespace :welcomeboard do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :create, :update, :destroy]
        get '/current_user', to: 'auth#show'
        get '/profile', to: 'users#profile'
        post '/login', to: 'auth#create'
        resources :posts, only: [:index, :create, :update, :destroy]
        resources :mods, only: [:index, :create, :update, :destroy]
        resources :reports, only: [:index, :create, :update, :destroy]
        resources :likes, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
