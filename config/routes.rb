Rails.application.routes.draw do
  
  devise_for :admins
  mount RailsAdmin::Engine => '/panel', as: 'rails_admin'

 delete '/users/sign_out', to: 'sessions#destroy'
  
  # Outras rotas do Devise usando os controllers padrão
  devise_for :users, skip: [:sessions, :registrations]
  
  # Rotas para as ações de sessões (login e logout)
  as :user do
    post '/users/sign_in', to: 'devise/sessions#create'   # Autenticação
    delete '/users/sign_out', to: 'devise/sessions#destroy' # Logout
  end

  # Rotas para as ações de registro de usuários
  as :user do
    post '/users', to: 'devise/registrations#create'      # Criação de usuário
  end
  
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
