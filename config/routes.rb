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
    get '/users/mypage' => 'users#show'
    get '/users/mypage/edit' => 'users#edit'
    patch '/users/information' => 'users#update'
    get '/users/confirmation' => 'users#no_membership'
    patch '/users' => 'users#update_without'
    get '/users/:user_id/favorites' => 'favorites#index', as: :user_favorites
    get '/users/:user_id/visits' => 'visits#index', as: :user_visits
    resources :onsens, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :index, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :visits, only: [:create, :destroy]
    end

  end

  namespace :admin do
    patch '/users' => 'users#update_without'
    resources :onsens, only: [:new, :create, :index, :show, :edit, :update]
    resources :users, only: [:index, :show] do
      resources :reviews, only: [:index, :destroy]
    end
    resources :genre_tags, only: [:index]
    resources :senshitus, only: [:create, :destroy]
    resources :kounous, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end