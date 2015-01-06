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

ActiveRecord::Schema.define(version: 20150106021718) do

  create_table "app_subs", force: :cascade do |t|
    t.string   "app_name"
    t.string   "sub_name"
    t.string   "description"
    t.string   "score"
    t.string   "integer"
    t.string   "comment_count"
    t.string   "hot_score"
    t.string   "uid"
    t.integer  "flag"
    t.integer  "app_id"
    t.integer  "sub_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "app_subs", ["app_id"], name: "index_app_subs_on_app_id"
  add_index "app_subs", ["sub_id"], name: "index_app_subs_on_sub_id"

  create_table "apps", force: :cascade do |t|
    t.string   "app_name"
    t.string   "path"
    t.string   "name"
    t.string   "category"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subs", force: :cascade do |t|
    t.string   "sub_name"
    t.string   "description"
    t.string   "score"
    t.string   "integer"
    t.string   "icon_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "deadline"
  end

end
