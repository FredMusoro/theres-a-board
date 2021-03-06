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

ActiveRecord::Schema.define(version: 20151104195245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_mentors", force: :cascade do |t|
    t.integer  "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "available_mentors", ["mentor_id"], name: "index_available_mentors_on_mentor_id", using: :btree

  create_table "mentor_requests", force: :cascade do |t|
    t.integer  "student_id",                null: false
    t.boolean  "open",       default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "shares", force: :cascade do |t|
    t.string   "url",         null: false
    t.string   "title",       null: false
    t.string   "description"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start",      null: false
    t.integer  "tutor_id",   null: false
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "subject"
  end

  add_index "timeslots", ["start"], name: "index_timeslots_on_start", using: :btree
  add_index "timeslots", ["student_id"], name: "index_timeslots_on_student_id", using: :btree
  add_index "timeslots", ["tutor_id"], name: "index_timeslots_on_tutor_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "uid"
    t.string   "image"
    t.string   "email"
    t.boolean  "email_notify",            default: true,  null: false
    t.boolean  "text_notify",             default: false, null: false
    t.string   "cellphone",    limit: 15
  end

end
