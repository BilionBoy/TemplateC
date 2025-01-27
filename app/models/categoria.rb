# frozen_string_literal: true

class Categoria < ApplicationRecord
  # Relacionamentos
  belongs_to :estabelecimento
  has_many :produtos
  # Validações
  validates :nome,               presence: true
  validates :descricao,          presence: true
  validates :estabelecimento_id, presence: true
end
