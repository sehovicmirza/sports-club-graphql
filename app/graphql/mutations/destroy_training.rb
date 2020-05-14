# frozen_string_literal: true

module Mutations
  class DestroyTraining < BaseMutation
    field :errors, [String], null: true
    field :training, Types::TrainingType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      if (training = Training.destroy_by(id: id).first)
        { training: training }
      else
        { errors: [I18n.t(:invalid_training_delete, scope: :custom_errors, default: nil)] }
      end
    end
  end
end
