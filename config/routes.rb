Rails.application.routes.draw do
  resources :appointments
  devise_for :users, controllers: { invitations: 'devise/invitations' }
  root 'home#index'
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
