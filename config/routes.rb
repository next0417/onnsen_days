Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"


  scope module: :public do
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    get '/users/mypage' => 'users#show'
    get '/users/mypage/edit' => 'users#edit'
    patch '/users/information' => 'users#update'
    get '/users/confirmation' => 'users#confirmation'
    patch '/users' => 'users#update_without'
    resources :onsens, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :index, :destroy]
    end
    resources :favorites, only: [:create, :index, :destroy]
    resources :visits, only: [:create, :index, :destroy]
  end

  namespace :admin do
    resources :onsens, only: [:new, :create, :index, :show, :edit, :update]
    resources :users, only: [:index, :show] do
      resources :reviews, only: [:index, :destroy]
    end
    resources :genre_tags, only: [:index]
    resources :senshitus, only: [:create, :destroy]
    resources :kounous, only: [:create, :destroy]
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end