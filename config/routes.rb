Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  post '/homes/guest_sign_in', to: 'public/homes#guest_sign_in'

  scope module: :public do
    get '/users/no_membership' => 'users#no_membership'
    patch '/users/update_without' => 'users#update_without', as: :update_without
    get '/users/:user_id/favorites' => 'favorites#index', as: :user_favorites
    get '/users/:user_id/visits' => 'visits#index', as: :user_visits
    resources :users, only: [:show, :edit, :update]
    resources :onsens, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :index, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :visits, only: [:create, :destroy]
    end
  end

  namespace :admin do
    patch '/user/update_without/:id' => 'users#update_without', as: :update_without
    patch '/user/update_within/:id' => 'users#update_within', as: :update_within
    resources :onsens, only: [:new, :create, :index, :show, :edit, :update]
    resources :users, only: [:index, :show] do
      resources :reviews, only: [:index, :destroy]
    end
    resources :genre_tags, only: [:index]
    match 'genre_tags' => "senshitus#create", :via => :post, :as => :post_senshitsu
    match 'genre_tags' => "kounous#create", :via => :post, :as => :post_kounou
    resources :senshitus, only: [:destroy]
    resources :kounous, only: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end