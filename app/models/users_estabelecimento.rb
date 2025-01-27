# frozen_string_literal: true

class UsersEstabelecimento < ApplicationRecord
  # Relacionamentos
  belongs_to :estabelecimento
  belongs_to :user
  # Validações
end
