# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Relacionamentos
  belongs_to :funcao
  has_many :users_estabelecimentos
  has_many :estabelecimentos, through: :users_estabelecimentos

  # Validações
  validates :nome,     presence: true
  validates :email,    presence: true
  validates :cpf,      presence: true, uniqueness: true, format: { with: /\A\d{11}\z/, message: "deve conter 11 dígitos numéricos" }
  validates :telefone, presence: true
end
