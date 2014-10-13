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

ActiveRecord::Schema.define(version: 20141013082546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "effects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "hue"
    t.float    "saturation"
    t.float    "contrast"
    t.float    "brightness"
  end

  create_table "effects_images", id: false, force: true do |t|
    t.integer "image_id",  null: false
    t.integer "effect_id", null: false
  end

  create_table "filters", force: true do |t|
    t.float    "hue"
    t.float    "saturation"
    t.float    "contrast"
    t.float    "brightness"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "owner"
    t.integer  "number_of_images"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries_images", id: false, force: true do |t|
    t.integer "gallery_id", null: false
    t.integer "image_id",   null: false
  end

  create_table "galleries_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "gallery_id", null: false
  end

  create_table "images", force: true do |t|
    t.float    "height"
    t.float    "width"
    t.string   "title"
    t.text     "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "owner"
    t.float    "size"
    t.string   "image"
  end

  create_table "images_users", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "image_id", null: false
  end

  create_table "media", force: true do |t|
    t.string   "owner"
    t.float    "size"
    t.string   "type"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "media_id"
  end

  create_table "media_users", id: false, force: true do |t|
    t.integer "user_id",   null: false
    t.integer "medium_id", null: false
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
