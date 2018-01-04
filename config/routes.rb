Rails.application.routes.draw do
  resources :events
  devise_for :admins
	resources :games do
  		resources :comments
	end

  get 'games/index'

	get 'admins/:id' => 'admins#show', as: "show"
	get 'games/:id(/:idU)' => 'games#show', as: "showGame"

  #resources :events do
  #  collection do
  #    get :participate
  #  end
  #end
  #resources :events do
  #  member do
  #    patch 'participate'
  #  end
  #end

  get 'events/:id/register' => 'events#register', as: "register"
  get 'events/:id/leave' => 'events#leave', as: "leave"

  root 'games#index'

end
