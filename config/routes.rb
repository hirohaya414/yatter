Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	devise_for :members

	resources :members, except: [:new, :create, :destroy] do
		get :confirm, on: :collection
		patch '/hide' => 'members#hide', on: :member
	end

	resources :articles
	get '/about' => 'home#about'
	root 'home#top'
end
