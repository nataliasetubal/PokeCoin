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

ActiveRecord::Schema[7.0].define(version: 2023_01_16_121740) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pokemon_acquisitions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.index ["pokemon_id"], name: "index_pokemon_acquisitions_on_pokemon_id"
    t.index ["user_id"], name: "index_pokemon_acquisitions_on_user_id"
  end

  create_table "pokemon_sales", force: :cascade do |t|
    t.decimal "value", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.index ["pokemon_id"], name: "index_pokemon_sales_on_pokemon_id"
    t.index ["user_id"], name: "index_pokemon_sales_on_user_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.integer "base_experience", null: false
    t.boolean "sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "value", default: "0.0"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "pokemon_acquisitions", "pokemons"
  add_foreign_key "pokemon_acquisitions", "users"
  add_foreign_key "pokemon_sales", "pokemons"
  add_foreign_key "pokemon_sales", "users"
end
