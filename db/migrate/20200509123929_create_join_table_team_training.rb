# frozen_string_literal: true

class CreateJoinTableTeamTraining < ActiveRecord::Migration[6.0]
  def change
    create_join_table :teams, :trainings do |t|
      t.index %i[team_id training_id]
    end
  end
end
