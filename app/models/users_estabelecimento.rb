# frozen_string_literal: true

class UsersEstabelecimento < ApplicationRecord
  # Relacionamentos
  belongs_to :user
  belongs_to :estabelecimento
  # Validações
end
