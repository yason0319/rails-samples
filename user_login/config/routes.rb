Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/Top', to: 'home#index'
  get '/New', to: 'home#index'
  get '/AdTop', to: 'home#index'
  get '/Search', to: 'home#index'

  namespace :api, format: 'json' do
    
    resources :users
    namespace :users do
      post '/check', :action => 'check'
      post '/reg', :action => 'registration'
    end

    resources :books
  end
end