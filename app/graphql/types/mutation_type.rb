module Types
  class MutationType < Types::BaseObject
    field :update_attendance, mutation: Mutations::UpdateAttendance
    field :destroy_training, mutation: Mutations::DestroyTraining
    field :create_training, mutation: Mutations::CreateTraining
    field :create_player, mutation: Mutations::CreatePlayer
  end
end
