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

ActiveRecord::Schema.define(version: 2021_06_08_163433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "level"
    t.float "min_weight"
    t.float "max_weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.float "weight"
    t.string "document"
    t.boolean "winner?"
    t.bigint "level_id", null: false
    t.bigint "academy_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["academy_id"], name: "index_fighters_on_academy_id"
    t.index ["category_id"], name: "index_fighters_on_category_id"
    t.index ["level_id"], name: "index_fighters_on_level_id"
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "round_id", null: false
    t.index ["category_id"], name: "index_fights_on_category_id"
    t.index ["round_id"], name: "index_fights_on_round_id"
    t.index ["tournament_id"], name: "index_fights_on_tournament_id"
  end

  create_table "fights_fighters", force: :cascade do |t|
    t.bigint "fight_id", null: false
    t.bigint "fighter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fight_id"], name: "index_fights_fighters_on_fight_id"
    t.index ["fighter_id"], name: "index_fights_fighters_on_fighter_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "academy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["academy_id"], name: "index_registrations_on_academy_id"
    t.index ["tournament_id"], name: "index_registrations_on_tournament_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "number"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_rounds_on_category_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tournaments_categories", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_tournaments_categories_on_category_id"
    t.index ["tournament_id"], name: "index_tournaments_categories_on_tournament_id"
  end

  add_foreign_key "fighters", "academies"
  add_foreign_key "fighters", "categories"
  add_foreign_key "fighters", "levels"
  add_foreign_key "fights", "categories"
  add_foreign_key "fights", "rounds"
  add_foreign_key "fights", "tournaments"
  add_foreign_key "fights_fighters", "fighters"
  add_foreign_key "fights_fighters", "fights"
  add_foreign_key "registrations", "academies"
  add_foreign_key "registrations", "tournaments"
  add_foreign_key "rounds", "categories"
  add_foreign_key "tournaments_categories", "categories"
  add_foreign_key "tournaments_categories", "tournaments"
end
