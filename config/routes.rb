Nawigroupe::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :static_pages

  get '/admin', to: redirect('/users/sign_in')

  root :to => "home#index"
end