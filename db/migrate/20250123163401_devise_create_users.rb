# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.2]
  def up
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.references :funcao, null: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def down
    drop_table :users
  end
end
