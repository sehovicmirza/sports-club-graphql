module Types
  # TODO: Handle polymorphic association
  class AttendanceType < Types::BaseObject
    field :id, ID, null: false
    field :presence, Boolean, null: false
    field :session_date, GraphQL::Types::ISO8601DateTime, null: false
    field :training, Types::TrainingType, null: false

    def training
      object.training
    end

    def presence
      object.presence
    end
  end
end
