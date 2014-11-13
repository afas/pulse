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

ActiveRecord::Schema.define(version: 20141113135130) do

  create_table "entities", force: true do |t|
    t.integer  "pulse_id"
    t.string   "name"
    t.string   "fullname"
    t.string   "address"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_attachments", force: true do |t|
    t.integer  "publication_id"
    t.string   "title"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.integer  "region_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "date_start"
    t.time     "time_start"
    t.integer  "author_id"
    t.string   "author"
    t.datetime "date_publish"
    t.datetime "date_archive"
    t.integer  "publication_status", default: 4
    t.integer  "publisher_id"
    t.integer  "publication_type"
    t.integer  "category"
    t.string   "title"
    t.string   "subtitle"
    t.text     "body"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pulse_id"
  end

  create_table "regions", force: true do |t|
    t.string  "name"
    t.integer "code"
    t.boolean "public", default: false
  end

  create_table "service_data", force: true do |t|
    t.integer  "publication_id"
    t.string   "title"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.string   "surname"
    t.integer  "role",                   default: 3,  null: false
    t.integer  "company_id"
    t.text     "about"
    t.integer  "region"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
