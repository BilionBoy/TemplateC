# frozen_string_literal: true

class CreateUsersEstabelecimentos < ActiveRecord::Migration[7.2]
  def up
    create_table :users_estabelecimentos do |t|
      t.references :user
      t.references :estabelecimento
          
      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :users_estabelecimentos
  end
end
