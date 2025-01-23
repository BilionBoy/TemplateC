Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  # Rota para a página inicial
  root "home#index"
  get "home/index"

  # Rotas Scaffold
  resources :funcoes


  # Status da Aplicação
  get "up" => "rails/health#show", as: :rails_health_check
end
