# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  team = Team.create(name: Faker::Team.unique.name)

  Faker::Number.between(from: 12, to: 18).times do
    team.players.create(
      name:  Faker::Name.first_name,
      email: Faker::Internet.email
    )
  end

  5.times do
    team.trainings.create(
      starts_at: Faker::Date.between(from: Date.today, to: 1.year.from_now).iso8601
    )
  end

  team.players.each do |player|
    team.trainings.each do |training|
      Attendance.create(
        attendable:   player,
        training:     training,
        presence:     Faker::Boolean.boolean,
        session_date: training.starts_at
      )
    end
  end
end
