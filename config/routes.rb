Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
  	resources :likes
  	 resources :comments do
  	  resources :likes
  	    resources :replies do
  		 resources :likes
  	end
  end
end

  get 'posts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
