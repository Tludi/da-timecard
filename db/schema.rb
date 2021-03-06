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

ActiveRecord::Schema.define(version: 20170428220758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "contact"
    t.string   "contact_phone"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id"
  end

  create_table "time_punches", force: :cascade do |t|
    t.datetime "entry"
    t.integer  "workday_id"
    t.boolean  "clockedInStatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "role"
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "pin"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "account_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "workdays", force: :cascade do |t|
    t.decimal  "hoursWorked"
    t.date     "dayDate"
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
