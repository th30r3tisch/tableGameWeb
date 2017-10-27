Rails.application.routes.draw do
	resources :games do
  		resources :comments
	end
	
  	get 'games/index'

  	root 'games#index'
end
