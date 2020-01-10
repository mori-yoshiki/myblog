Rails.application.routes.draw do
  get 'blogs/new'
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :blogs
  post '/blogs/:id/update',  to: 'blogs#edit'
  
end