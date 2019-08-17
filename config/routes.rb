Rails.application.routes.draw do
	mount_devise_token_auth_for 'User', at: 'auth'
	namespace :api do
		namespace :v1 do
			namespace :admin do
				resources :articles
				resources :projects
				resources :collaborators
				resources :documents
			end
		  resources :articles
		  resources :projects
		  resources :collaborators
			resources :documents, only: [:index, :show]
		end
	end
	post 'contact', to: 'contacts#create'
end
