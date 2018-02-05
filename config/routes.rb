Rails.application.routes.draw do
  resources :events
  devise_for :admins

  get 'games/filter' => 'games#filter', as: "gamesFilter"

	resources :games do
  		resources :comments
	end

  get 'games/index'

	get 'admins/:id' => 'admins#show', as: "show"
	get 'games/:id(/:idU)' => 'games#show', as: "showGame"

  get 'events/:id/register' => 'events#register', as: "register"
  get 'events/:id/leave' => 'events#leave', as: "leave"

  root 'games#index'

end
