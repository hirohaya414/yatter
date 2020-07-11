Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    passwords: 'members/passwords',
    registrations: 'members/registrations'
  }

  resources :members, only: [:edit, :show, :update] do
    get :confirm, on: :collection
    patch '/hide' => 'members#hide', on: :member
  end

  resources :articles do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get '/about' => 'home#about'
  root 'home#top'
end
