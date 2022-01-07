Rails.application.routes.draw do


  root "static#index"

  scope module: :users do
    get 'dashboard', to: "dashboard#show"
    # Auth0
    match "auth/auth0/callback", to: "auth0#callback", via: [:get, :post]
    get "auth/failure", to: "auth0#failure"
    get 'auth/logout', to: 'auth0#logout'
  end
end
