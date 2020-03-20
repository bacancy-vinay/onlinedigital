# frozen_string_literal: true

# All routes
Rails.application.routes.draw do
  get 'states/address_state'
  get 'cities/address_city'
  get 'states/education_state'
  get 'cities/education_city'
  get 'states/experience_state'
  get 'cities/experience_city'
  get 'resumes/sidebar'
  get 'sub_fields/subfield'

  resources :main_fields
  resources :sub_fields
  resources :admins do
    get 'admin_resume', on: :collection
    get 'admin_business', on: :collection
    get 'jobfield', on: :collection
  end
  resources :dashboards
  devise_for :users
  resources :resumes, except: [:edit] do
    get 'edit', to: 'resumes#edit'
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
