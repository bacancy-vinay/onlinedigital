Rails.application.routes.draw do
  get 'dashboards/index'
    devise_for :users

  resources :resumes
  resources :businesses
  root 'dashboards#index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
