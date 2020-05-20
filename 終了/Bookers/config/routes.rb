Rails.application.routes.draw do
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'top#top'
	resources :books, only: [:new, :create, :index, :show, :edit]
	resources :users, only: [:show, :index ,:edit]
	devise_scope :user do
	get '/users/sign_out' => 'devise/sessons#destroy'
	end
end
