module Types
  class TeamType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :players, [Types::PlayerType], null: true
    field :players_count, Integer, null: true

    def players_count
      object.players.count
    end
  end
end
