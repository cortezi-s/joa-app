Rails.application.routes.draw do
  resources :sections
	mount_devise_token_auth_for 'User', at: 'auth'
	namespace :api do
		namespace :v1 do
			namespace :admin do
				resources :sections, param: :name
				resources :articles
				resources :projects
				resources :collaborators
				resources :documents
			end
			resources :sections, param: :name
			resources :articles
			resources :projects
			resources :collaborators
			resources :documents, only: [:index, :show]
		end
	end
	post 'contact', to: 'contacts#create'
end
