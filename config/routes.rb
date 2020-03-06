# frozen_string_literal: true

# All routes
Rails.application.routes.draw do
  get 'admins/index'
  get 'states/address_state'
  get 'cities/address_city'
  get 'states/education_state'
  get 'cities/education_city'
  get 'states/experience_state'
  get 'cities/experience_city'
  get 'resumes/sidebar'
  resources :dashboards
  devise_for :users
  resources :resumes do
    resources :resumeusers
    resources :addresses
    resources :fieldchoices
    resources :contacts
    resources :educations
    resources :experiences
    resources :abouts
    resources :skills
    resources :interests
  end
  resources :businesses
  root 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
