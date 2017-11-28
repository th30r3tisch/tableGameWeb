Rails.application.routes.draw do
  resources :events
    devise_for :admins
	resources :games do
  		resources :comments
	end

  	get 'games/index'
	
	get 'admins/:id' => 'admins#show', as: "show"
	get 'games/:id(/:idU)' => 'games#show', as: "showGame"
	

  	root 'games#index'

end
