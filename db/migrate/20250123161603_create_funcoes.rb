# frozen_string_literal: true

class CreateFuncoes < ActiveRecord::Migration[7.2]
  def up
    create_table :funcoes do |t|
      t.string :nome

      t.string :created_by
      t.string :updated_by
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def down
    drop_table :funcoes
  end
end
