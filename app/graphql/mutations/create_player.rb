module Mutations
  class CreatePlayer < BaseMutation
    field :player, Types::PlayerType, null: false
    field :errors, [String], null: false

    argument :name, String, required: true
    argument :email, String, required: true

    def resolve(name:, email:)
      player = Player.new(name: name, email: email)

      if player.save
        {
          player: player,
          errors: []
        }
      else
        {
          player: nil,
          errors: player.errors.full_messages
        }
      end
    end
  end
end
