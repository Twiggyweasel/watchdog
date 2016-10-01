# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160930224334) do

  create_table "clearances", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "constructions", force: :cascade do |t|
    t.string   "location"
    t.string   "construction_type"
    t.string   "date_of_completion"
    t.text     "construction_details"
    t.date     "date_of_start"
    t.boolean  "archived",             default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "event_type"
    t.string   "time"
    t.text     "details"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.string "name"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "location"
    t.string   "extension"
    t.string   "phone_number"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "listings", ["department_id"], name: "index_listings_on_department_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "gender"
    t.string   "weight"
    t.string   "height"
    t.string   "age"
    t.text     "reason_short"
    t.text     "reason_detailed"
    t.text     "wearing"
    t.boolean  "cfa",             default: false
    t.boolean  "contact",         default: false
    t.boolean  "archived",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "incident_id"
  end

  add_index "people", ["incident_id"], name: "index_people_on_incident_id"

  create_table "tips", force: :cascade do |t|
    t.text     "totd"
    t.boolean  "archived",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "employee_num"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "clearance_id"
    t.integer  "department_id"
  end

  add_index "users", ["clearance_id"], name: "index_users_on_clearance_id"
  add_index "users", ["department_id"], name: "index_users_on_department_id"

end
