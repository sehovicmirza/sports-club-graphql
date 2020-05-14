# frozen_string_literal: true

class CreateJoinTableTeamPlayer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :teams, :players do |t|
      t.index %i[team_id player_id]
    end
  end
end
