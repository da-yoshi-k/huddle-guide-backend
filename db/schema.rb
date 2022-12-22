# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_21_162644) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.integer "role", default: 0, null: false
    t.uuid "user_id", null: false
    t.uuid "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "workshop_id", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
    t.index ["workshop_id"], name: "index_messages_on_workshop_id"
  end

  create_table "participations", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "workshop_id", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_participations_on_user_id"
    t.index ["workshop_id"], name: "index_participations_on_workshop_id"
  end

  create_table "posts", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "workshop_id", null: false
    t.string "content", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index ["workshop_id"], name: "index_posts_on_workshop_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.uuid "user_id", null: false
    t.bigint "post_id", null: false
    t.integer "reaction_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_reactions_on_post_id"
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "work_steps", force: :cascade do |t|
    t.bigint "work_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_work_steps_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshops", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "team_id", null: false
    t.bigint "work_id", null: false
    t.bigint "work_step_id", null: false
    t.datetime "work_date"
    t.string "facilitator"
    t.string "presenter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_workshops_on_team_id"
    t.index ["work_id"], name: "index_workshops_on_work_id"
    t.index ["work_step_id"], name: "index_workshops_on_work_step_id"
  end

  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "workshops"
  add_foreign_key "participations", "users"
  add_foreign_key "participations", "workshops"
  add_foreign_key "posts", "users"
  add_foreign_key "posts", "workshops"
  add_foreign_key "reactions", "posts"
  add_foreign_key "reactions", "users"
  add_foreign_key "work_steps", "works"
  add_foreign_key "workshops", "teams"
  add_foreign_key "workshops", "work_steps"
  add_foreign_key "workshops", "works"
end
