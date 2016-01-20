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

ActiveRecord::Schema.define(version: 20160118163120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leads", force: :cascade do |t|
    t.string  "company_id",        null: false
    t.string  "company_name",      null: false
    t.string  "phys_address",      null: false
    t.string  "phys_city",         null: false
    t.string  "phys_state",        null: false
    t.string  "phys_zip",          null: false
    t.string  "phys_county"
    t.string  "mail_address"
    t.string  "mail_city"
    t.string  "mail_state"
    t.string  "mail_zip"
    t.string  "phone"
    t.string  "alt_phone"
    t.string  "toll_free_phone"
    t.string  "fax_phone"
    t.string  "website"
    t.string  "email"
    t.integer "employees_on_site", null: false
    t.string  "annual_sales"
    t.integer "sqr_footage"
    t.integer "year_est"
    t.string  "area_of_dist"
    t.string  "ownership"
    t.boolean "imports"
    t.boolean "woman_owned"
    t.boolean "minority_owned"
    t.text    "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
