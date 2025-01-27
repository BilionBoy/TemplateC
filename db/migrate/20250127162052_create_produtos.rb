# frozen_string_literal: true

class CreateProdutos < ActiveRecord::Migration[7.2]
  def up
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :preco
      t.references :categoria, null: false, foreign_key: true
      t.integer :quantidade_estoque


      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :produtos
  end
end
