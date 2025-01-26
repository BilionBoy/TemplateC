# frozen_string_literal: true

class UsersEstabelecimento < ApplicationRecord
  # Adicione aqui quaisquer métodos ou validações padrão para seus modelos
  belongs_to :user
  belongs_to :estabelecimento
end
