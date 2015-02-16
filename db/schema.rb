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

ActiveRecord::Schema.define(version: 20150214135410) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "", null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  add_index "admins", ["username"], name: "index_admins_on_username", unique: true

  create_table "conferences", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.date     "date"
    t.integer  "attenders"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "report"
    t.string   "location"
    t.string   "photo"
    t.string   "video"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "telephone"
    t.string   "email"
    t.string   "skype"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "defaultDuration"
    t.string   "color"
    t.integer  "image"
    t.integer  "speakerEvent"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "groupable"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "conference_id"
    t.integer  "speaker_id"
    t.integer  "event_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
    t.datetime "duration"
    t.integer  "position"
  end

  create_table "events_types", force: :cascade do |t|
    t.string   "eventstype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "conference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "place_type"
    t.string   "name"
    t.string   "city"
  end

  create_table "speakers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "description"
    t.string   "surname"
    t.string   "email"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "site"
    t.string   "message"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "years", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
