Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # resources :auths, only: [:create]
  resources :kinds

  api_version(module: 'V1', path: { value: 'v1' }) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: %i[update create destroy]
      resource :phone, only: %i[update create destroy], path: 'relationships/phones'

      resource :address, only: %i[show update create destroy]
      resource :address, only: %i[show update create destroy], path: 'relationships/address'
    end
  end

  api_version(module: 'V2', path: { value: 'v2' }) do
    resources :contacts do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: %i[update create destroy]
      resource :phone, only: %i[update create destroy], path: 'relationships/phones'

      resource :address, only: %i[show update create destroy]
      resource :address, only: %i[show update create destroy], path: 'relationships/address'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
