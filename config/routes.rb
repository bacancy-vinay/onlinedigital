Rails.application.routes.draw do
 
  get 'states/index'
  get 'cities/index'
  get 'resumes/sidebar'
  devise_for :users
  resources :addresses
  resources :resumes
  resources :businesses
  resources :cities, only: :index
  resources :states, only: :index


  root 'dashboards#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
