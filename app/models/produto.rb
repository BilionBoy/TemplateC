# frozen_string_literal: true

class Produto < ApplicationRecord
  # Relacionamentos
  belongs_to :categoria
  has_one_attached :image
  # Validações
  validates :nome, presence: true
  validates :preco, presence: true
  validates :quantidade_estoque, presence: true
  validates :categoria, presence: true
end
