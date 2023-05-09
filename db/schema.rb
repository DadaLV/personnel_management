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

ActiveRecord::Schema[7.0].define(version: 2023_05_09_214343) do
  create_table "employees", force: :cascade do |t|
    t.integer "id_number"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "passport_data"
    t.date "date_of_birth"
    t.string "place_of_birth"
    t.string "home_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end