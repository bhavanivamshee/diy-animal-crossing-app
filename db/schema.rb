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

ActiveRecord::Schema.define(version: 2021_05_26_181708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diys", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "image_url"
    t.integer "recipes_to_unlock"
    t.jsonb "materials_diy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "diy_name"
    t.boolean "complete"
    t.string "name"
    t.integer "count"
    t.bigint "user_id", null: false
    t.bigint "diy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diy_id"], name: "index_materials_on_diy_id"
    t.index ["user_id"], name: "index_materials_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "island_name"
    t.string "username"
    t.string "email"
    t.string "dream_address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "materials", "diys"
  add_foreign_key "materials", "users"
end
