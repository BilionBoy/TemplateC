# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relacionamentos
  belongs_to :funcao
  # Validações
  validates :nome, presence: true
  validates :email, presence: true
  validates :cpf, presence: true
  validates :telefone, presence: true
end
