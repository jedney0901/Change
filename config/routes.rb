Rails.application.routes.draw do

  resources :debates do
    resources :submissions do
      collection do
        get 'pro'
        get 'con'
      end
    end
  end

  resources :conversations do
    resources :messages
  end

  root 'pages#home'

  get 'contact', to: "pages#contact"

  devise_for :users, controllers: {
    omniauth_callbacks: "callbacks",
    registrations: "profiles_registration", 
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
