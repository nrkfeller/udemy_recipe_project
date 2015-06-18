Rails.application.routes.draw do
  
  root 'pages#home'
  
  get '/home', to: 'pages#home'
  
  #get '/courses', to: 'courses#index'
  #get '/courses/new', to: 'courses#new', as: 'new_course'
  #post '/courses', to: 'courses#create'
  #get '/courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  #patch '/courses/:id', to: 'courses#update'
  #get '/courses/:id', to: 'courses#show', as: 'course'
  #delete '/courses/:id', to: 'courses#destroy'
  
  resources :courses
  


end
