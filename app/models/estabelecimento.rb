# frozen_string_literal: true

class Estabelecimento < ApplicationRecord
  # Relacionamento
  has_many :users_estabelecimentos
  has_many :users, through: :users_estabelecimentos
  has_many :categorias

  # Validações
  validates :nome, presence: true
end
