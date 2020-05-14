# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email, null: false

      t.timestamps
    end

    add_index :players, :email, unique: true
  end
end
