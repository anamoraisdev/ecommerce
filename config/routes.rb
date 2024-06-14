Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/panel', as: 'rails_admin'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
