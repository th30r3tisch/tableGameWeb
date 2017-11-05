Rails.application.routes.draw do
  devise_for :admins
	resources :games do
  		resources :comments
	end

  	get 'games/index'

  	root 'games#index'

end
