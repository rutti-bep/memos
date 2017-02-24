Rails.application.routes.draw do
  root to: 'memos#index'
  resources :memos
  resource :session
  get '/auth/:provider/callback', :to => 'sessions#create'
  post '/auth/provider/callback', :to => 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
