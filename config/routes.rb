Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  # Rotas para a página inicial
  root "home#index"
  get "home/index"


  # Rotas Scaffold
  resources :usuarios, only: [ :index, :show, :destroy ]
  resources :funcoes
  resources :users_estabelecimentos
  resources :estabelecimentos


  # Status da Aplicação
  get "up" => "rails/health#show", as: :rails_health_check
end
