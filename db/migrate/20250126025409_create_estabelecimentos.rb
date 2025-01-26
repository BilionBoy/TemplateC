# frozen_string_literal: true

class CreateEstabelecimentos < ActiveRecord::Migration[7.2]
  def up
    create_table :estabelecimentos do |t|
      t.string :nome
      t.string :cnpj
      t.string :endereco
      t.string :telefone

      t.timestamps
    end

    add_index :estabelecimentos, :cnpj, unique: true
  end

  def down
    drop_table :estabelecimentos
  end
end
