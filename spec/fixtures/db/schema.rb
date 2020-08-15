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

ActiveRecord::Schema.define(version: 2020_08_14_233516) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "ocenies", force: :cascade do |t|
    t.string "rateable_type"
    t.integer "rateable_id"
    t.string "rater_type"
    t.integer "rater_id"
    t.string "rating_type_category"
    t.string "rating_type"
    t.decimal "rating", precision: 5, scale: 2
    t.decimal "max_rating", precision: 5, scale: 2
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rateable_id", "rating"], name: "index_ocenies_on_rateable_id_and_rating"
    t.index ["rateable_type", "rateable_id"], name: "index_ocenies_on_rateable_type_and_rateable_id"
    t.index ["rater_id", "rating"], name: "index_ocenies_on_rater_id_and_rating"
    t.index ["rater_type", "rater_id"], name: "index_ocenies_on_rater_type_and_rater_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "books", "users"
end
