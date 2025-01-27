# frozen_string_literal: true

class Estabelecimento < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  #   has_many :users_estabelecimentos
  has_many :users_estabelecimentos

  has_many :users, through: :users_estabelecimentos
end
