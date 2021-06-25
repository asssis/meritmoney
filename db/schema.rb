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

ActiveRecord::Schema.define(version: 2021_06_22_235330) do

  create_table "check_emails", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_check_emails_on_user_id"
  end

  create_table "merit_moneys", force: :cascade do |t|
    t.integer "value", limit: 5
    t.text "reason", limit: 200
    t.string "reference", limit: 100
    t.integer "deposit_id"
    t.integer "received_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deposit_id"], name: "index_merit_moneys_on_deposit_id"
    t.index ["received_id"], name: "index_merit_moneys_on_received_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 50
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "dominio", limit: 100
    t.string "image", limit: 100
    t.integer "permission", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "merit_moneys", "users", column: "deposit_id"
  add_foreign_key "merit_moneys", "users", column: "received_id"
end
