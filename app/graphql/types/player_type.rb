# frozen_string_literal: true

module Types
  class PlayerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false

    field :attendance_rate, String, null: false do
      argument :game_day, GraphQL::Types::ISO8601DateTime, required: true
      argument :whole_season, Boolean, required: false, default_value: false
    end

    field :upcomming_schedule, [Types::TrainingType], null: true do
      argument :limit, Integer, required: false, default_value: 10
    end

    def attendance_rate(game_day:, whole_season:)
      object.attendance_rate(game_day, whole_season)
    end

    # TODO: Implement support for recurring trainings
    def upcomming_schedule(limit:)
      object.upcomming_schedule(limit)
    end
  end
end
