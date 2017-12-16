Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords"}
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations", passwords: "admins/passwords"}

  resources :events
  resources :games do
  		resources :comments
	end

  get 'games/index'

	get 'admins/:id' => 'admins#show', as: "show"
	get 'games/:id(/:idU)' => 'games#show', as: "showGame"


  root 'games#index'

end
