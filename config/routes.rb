Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "doctor#index"
  namespace :api do
    namespace :v1 do
      resources :doctors
    end
  end

  namespace :api do
    namespace :v1 do
    resources :appointments
  end
end
  
end



