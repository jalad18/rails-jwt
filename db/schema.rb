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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_08_11_112629) do
  create_table "cases", force: :cascade do |t|
    t.string "case_name"
    t.string "case_no"
    t.string "case_description"
    t.integer "case_status"
    t.string "court_name"
    t.datetime "filing_date"
    t.string "case_category"
    t.string "additional_notes"
    t.datetime "Hearing_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cases_on_user_id"
  end

  create_table "lawyer_details", force: :cascade do |t|
    t.string "license_no"
    t.integer "user_id", null: false
    t.string "practice_court_name"
    t.string "practice_field_name"
    t.string "experience"
    t.string "city"
    t.string "consultation_fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lawyer_details_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_news_on_user_id"
=======
ActiveRecord::Schema[7.0].define(version: 2023_08_10_123849) do
  create_table "properties", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.integer "price"
    t.integer "status"
    t.integer "year"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "property_id", null: false
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_reviews_on_property_id"
>>>>>>> origin/main
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "role"
  end

<<<<<<< HEAD
  add_foreign_key "cases", "users"
  add_foreign_key "lawyer_details", "users"
  add_foreign_key "news", "users"
=======
  add_foreign_key "properties", "users"
  add_foreign_key "reviews", "properties"
>>>>>>> origin/main
end
