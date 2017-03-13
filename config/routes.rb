Rails.application.routes.draw do
  resources :site_portfolios, except: [:show]
  get 'portfolio/:id', to: 'site_portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs do
	  member do
		  get :toggle_status
		end
	end
  
  root to: 'pages#home'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
