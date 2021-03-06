Rails.application.routes.draw do
  resources :appointments do
  	member do
  		post 'appointments/status'  	
  	end

    collection do
      get 'appointments/doctors'
      get 'appointments/patients'
      get 'appointments/simple_users'
    end
  end
  devise_for :users, controllers: { invitations: 'user/invitations', sessions: 'user/sessions',registrations: 'user/registrations',passwords: 'user/passwords' }
  root 'home#index'
  resources :accounts do 
   collection do
   		get 'accounts/users'
   end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
