module Types
  class QueryType < Types::BaseObject
    field :teams, [Types::TeamType], null: false

    field :team, Types::TeamType, null: false do
      argument :id, ID, required: true
    end

    field :training, Types::TrainingType, null: false do
      argument :id, ID, required: true
    end

    field :player, Types::PlayerType, null: false do
      argument :id, ID, required: true
    end

    field :attendance, Types::AttendanceType, null: false do
      argument :id, ID, required: true
    end

    def teams
      Team.all
    end

    def team(id:)
      Team.find id
    end

    def training(id:)
      Training.find id
    end

    def attendance(id:)
      Attendance.find id
    end

    def player(id:)
      Player.find id
    end
  end
end
