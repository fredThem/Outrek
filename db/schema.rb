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

ActiveRecord::Schema.define(version: 2021_03_27_153501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "checklist_items", force: :cascade do |t|
    t.bigint "checklist_id", null: false
    t.bigint "label_id", null: false
    t.text "detail"
    t.boolean "checked"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "checklists_id"
    t.bigint "labels_id"
    t.index ["checklist_id"], name: "index_checklist_items_on_checklist_id"
    t.index ["checklists_id"], name: "index_checklist_items_on_checklists_id"
    t.index ["label_id"], name: "index_checklist_items_on_label_id"
    t.index ["labels_id"], name: "index_checklist_items_on_labels_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_checklists_on_trip_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "email"
    t.index ["trip_id"], name: "index_invitations_on_trip_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "label_id"
    t.index ["label_id"], name: "index_items_on_label_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommended_item_labels", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "label_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_recommended_item_labels_on_activity_id"
    t.index ["label_id"], name: "index_recommended_item_labels_on_label_id"
  end

  create_table "trip_activities", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "trip_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_trip_activities_on_activity_id"
    t.index ["trip_id"], name: "index_trip_activities_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "destination"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.boolean "finished"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checklist_items", "checklists"
  add_foreign_key "checklist_items", "labels"
  add_foreign_key "checklists", "trips"
  add_foreign_key "invitations", "trips"
  add_foreign_key "invitations", "users"
  add_foreign_key "recommended_item_labels", "activities"
  add_foreign_key "recommended_item_labels", "labels"
  add_foreign_key "trips", "users"
end
