# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171129002900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "game_id"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_comments_on_admin_id"
    t.index ["game_id"], name: "index_comments_on_game_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "startDate"
    t.date "endDate"
    t.text "description"
    t.string "ort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_events_on_game_id"
  end

  create_table "events_player_dependencies", id: false, force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "event_id"
    t.index ["admin_id"], name: "index_events_player_dependencies_on_admin_id"
    t.index ["event_id"], name: "index_events_player_dependencies_on_event_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "playtime"
    t.integer "maxPlayer"
    t.string "gameType"
    t.integer "releaseYear"
    t.string "pictureUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "admins"
  add_foreign_key "comments", "games"
  add_foreign_key "events", "games"
  add_foreign_key "events_player_dependencies", "admins"
  add_foreign_key "events_player_dependencies", "events"
end
