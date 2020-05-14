# frozen_string_literal: true

class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.text :schedule
      t.datetime :starts_at, null: false
      t.datetime :ends_at

      t.timestamps
    end

    add_index :trainings, :starts_at, unique: true
  end
end
