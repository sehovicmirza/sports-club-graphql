# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.boolean    :presence, null: false, default: true
      t.datetime   :session_date, null: false
      t.integer    :attendable_id, null: false
      t.string     :attendable_type, null: false
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end

    add_index :attendances, %i[attendable_id training_id]
  end
end
