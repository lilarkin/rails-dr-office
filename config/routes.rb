Rails.application.routes.draw do
  root 'doctors#index'

  resources :doctors
  resources :patients
  resources :appointments, only: [:new, :create, :destroy]
end
