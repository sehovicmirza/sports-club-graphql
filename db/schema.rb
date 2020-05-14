# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_09_123929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.boolean "presence", default: true, null: false
    t.datetime "session_date", null: false
    t.integer "attendable_id", null: false
    t.string "attendable_type", null: false
    t.bigint "training_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendable_id", "training_id"], name: "index_attendances_on_attendable_id_and_training_id"
    t.index ["training_id"], name: "index_attendances_on_training_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_players_on_email", unique: true
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "player_id", null: false
    t.index ["team_id", "player_id"], name: "index_players_teams_on_team_id_and_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "teams_trainings", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "training_id", null: false
    t.index ["team_id", "training_id"], name: "index_teams_trainings_on_team_id_and_training_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.text "schedule"
    t.datetime "starts_at", null: false
    t.datetime "ends_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["starts_at"], name: "index_trainings_on_starts_at", unique: true
  end

  add_foreign_key "attendances", "trainings"
end
