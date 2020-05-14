# frozen_string_literal: true

module Mutations
  class CreateTraining < BaseMutation
    field :training, Types::TrainingType, null: true
    field :errors, [String], null: true

    argument :starts_at, GraphQL::Types::ISO8601DateTime, required: true
    argument :team_ids, [ID], required: true
    argument :schedule, String, required: false

    def resolve(starts_at:, team_ids:, schedule:)
      if [1, 2].include?(team_ids.uniq!.size)
        training = Training.new(starts_at: starts_at, team_ids: team_ids, schedule: schedule)
        training.save ? { training: training } : { errors: training.errors.full_messages }
      else
        { errors: [I18n.t(:invalid_training_create, scope: :custom_errors, default: nil)] }
      end
    end
  end
end
