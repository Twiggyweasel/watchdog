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

ActiveRecord::Schema.define(version: 20161013152454) do

  create_table "clearances", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concerns", force: :cascade do |t|
    t.string   "concern_name"
    t.text     "concern_description"
    t.date     "date_of_start"
    t.boolean  "archived"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "contype_id"
  end

  add_index "concerns", ["contype_id"], name: "index_concerns_on_contype_id"

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

  create_table "contypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "evetype_id"
    t.integer  "venue_id"
  end

  add_index "events", ["evetype_id"], name: "index_events_on_evetype_id"
  add_index "events", ["venue_id"], name: "index_events_on_venue_id"

  create_table "evetypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hours", force: :cascade do |t|
    t.string "restaurant_name"
    t.string "monday"
    t.string "tuesday"
    t.string "wednesday"
    t.string "thursday"
    t.string "friday"
    t.string "saturday"
    t.string "sunday"
    t.string "secondary"
    t.text   "restaurant_details"
    t.text   "restaurant_promotions"
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
    t.boolean  "seeded",     default: false
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

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",                     null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 1073741823
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
