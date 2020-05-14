module Mutations
  class DestroyTraining < BaseMutation
    argument :id, Integer, required: true

    type Types::TrainingType

    def resolve(id:)
      Training.find(id).destroy
    end
  end
end
