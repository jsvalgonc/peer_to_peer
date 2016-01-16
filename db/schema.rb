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

ActiveRecord::Schema.define(version: 20160115234810) do

  create_table "account_movements", force: :cascade do |t|
    t.date     "value_date"
    t.date     "movement_date"
    t.decimal  "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "investor_id"
    t.text     "description"
    t.integer  "status"
    t.integer  "movement_type"
  end

  add_index "account_movements", ["investor_id"], name: "index_account_movements_on_investor_id"

  create_table "app_parameters", force: :cascade do |t|
    t.string   "parameter"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.integer  "investor_id"
    t.integer  "value"
    t.boolean  "confirmed"
    t.date     "confirmation_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "project_id"
    t.integer  "paid_capital",      default: 0
    t.integer  "paid_interest",     default: 0
    t.integer  "accrued_interest",  default: 0
    t.integer  "status"
  end

  create_table "entrepreneurs", force: :cascade do |t|
    t.text     "full_name"
    t.text     "address"
    t.text     "zip_code"
    t.text     "town"
    t.text     "country"
    t.text     "fiscal_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "legal_nature"
    t.text     "phone_number"
    t.text     "person_in_charge"
    t.text     "main_activity"
    t.text     "capital"
    t.integer  "start_year"
    t.integer  "other_debt"
    t.integer  "other_costs"
    t.boolean  "credit_delay"
  end

  create_table "installments", force: :cascade do |t|
    t.integer  "project_id"
    t.decimal  "value"
    t.date     "reference_date"
    t.decimal  "interest"
    t.decimal  "capital"
    t.integer  "status"
    t.integer  "process_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "installments", ["project_id"], name: "index_installments_on_project_id"

  create_table "investors", force: :cascade do |t|
    t.string   "full_name"
    t.string   "address"
    t.string   "zip_code"
    t.string   "town"
    t.string   "country"
    t.string   "NIF"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "fiscal_number"
    t.integer  "user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "value"
    t.text     "description"
    t.date     "start_date"
    t.integer  "duration"
    t.integer  "entrepreneur_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "status"
    t.float    "open_balance",    default: 0.0
    t.float    "interest_rate"
    t.float    "installment"
    t.datetime "end_date"
  end

  add_index "projects", ["entrepreneur_id"], name: "index_projects_on_entrepreneur_id"

  create_table "temp", force: :cascade do |t|
    t.integer  "investor_id"
    t.integer  "value"
    t.boolean  "confirmed"
    t.date     "confirmation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "project_id"
    t.integer  "paid_capital"
    t.integer  "paid_interest"
    t.integer  "accrued_interest"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
