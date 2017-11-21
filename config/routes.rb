Rails.application.routes.draw do
    devise_for :admins
	resources :games do
  		resources :comments
	end

  	get 'games/index'
	
	get 'admins/:id' => 'admins#show', as: "show"

  	root 'games#index'

end
