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

ActiveRecord::Schema.define(version: 20160620130704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "conferences", force: :cascade do |t|
    t.string   "name"
    t.integer  "year_id"
    t.datetime "date"
    t.integer  "attenders"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "report"
    t.string   "location"
    t.boolean  "published"
    t.date     "registration_deadline"
    t.string   "video"
    t.string   "photo"
    t.boolean  "group_event"
  end

  create_table "configurations", force: :cascade do |t|
    t.boolean "apply_date_validation"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "telephone"
    t.string   "email"
    t.string   "skype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts_locations", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "location_id"
  end

  add_index "contacts_locations", ["contact_id"], name: "index_contacts_locations_on_contact_id", using: :btree
  add_index "contacts_locations", ["location_id"], name: "index_contacts_locations_on_location_id", using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "default_duration"
    t.string   "color"
    t.string   "image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "speaker_event"
    t.boolean  "groupable"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "conference_id"
    t.integer  "speaker_id"
    t.integer  "event_type_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "description"
    t.datetime "duration"
    t.integer  "position"
    t.string   "responsable"
    t.string   "video"
    t.string   "materials_file_name"
    t.string   "materials_content_type"
    t.integer  "materials_file_size"
    t.datetime "materials_updated_at"
    t.boolean  "published"
    t.string   "materials_link"
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "email"
    t.string   "conference_id"
    t.string   "message_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "email_hash"
    t.string   "status"
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
    t.text     "how_to_find"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
    t.integer  "version"
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "conference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "report"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "responsable"
    t.string   "title"
    t.string   "description"
    t.integer  "conference_id"
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
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "position"
    t.string   "twitter"
  end

  create_table "years", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "published"
  end

end
