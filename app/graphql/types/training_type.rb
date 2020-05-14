# frozen_string_literal: true

module Types
  class TrainingType < Types::BaseObject
    field :schedule, String, null: true
    field :starts_at, GraphQL::Types::ISO8601DateTime, null: false
    field :teams, [Types::TeamType], null: false

    def teams
      object.teams
    end
  end
end
