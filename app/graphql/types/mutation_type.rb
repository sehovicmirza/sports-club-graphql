# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_attendance, mutation: Mutations::UpdateAttendance
    field :destroy_training, mutation: Mutations::DestroyTraining
    field :create_training, mutation: Mutations::CreateTraining
  end
end
