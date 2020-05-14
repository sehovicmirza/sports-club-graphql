module Mutations
  class CreateTraining < BaseMutation
    field :training, Types::TrainingType, null: false
    field :errors, [String], null: false

    argument :starts_at, GraphQL::Types::ISO8601DateTime, required: true
    argument :team_ids, [ID], required: true
    argument :schedule, String, required: false

    def resolve(starts_at:, team_ids:, schedule:)
      training = Training.new(starts_at: starts_at, team_ids: team_ids, schedule: schedule)

      if training.save
        {
          training: training,
          errors:   []
        }
      else
        {
          training: nil,
          errors:   training.errors.full_messages
        }
      end
    end
  end
end
