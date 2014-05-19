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

ActiveRecord::Schema.define(version: 20140519132708) do

  create_table "applications", force: true do |t|
    t.string   "reg_number"
    t.string   "app_number"
    t.string   "service_type"
    t.float    "paid_amount"
    t.datetime "reg_date"
    t.string   "bank_info"
    t.datetime "paid_date"
    t.string   "service_duration"
    t.string   "property_address"
    t.string   "cadastral_code"
    t.text     "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications_people", id: false, force: true do |t|
    t.integer "application_id", null: false
    t.integer "person_id",      null: false
  end

  create_table "documents", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "number"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  add_index "documents", ["application_id"], name: "index_documents_on_application_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "person_number"
    t.string   "address"
    t.string   "role"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
