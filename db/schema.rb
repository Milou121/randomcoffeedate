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

ActiveRecord::Schema.define(version: 20160615123029) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "koffies", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "time"
    t.date     "date"
    t.string   "sender_status"
    t.string   "receiver_status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "koffies", ["location_id"], name: "index_koffies_on_location_id"
  add_index "koffies", ["receiver_id"], name: "index_koffies_on_receiver_id"
  add_index "koffies", ["sender_id"], name: "index_koffies_on_sender_id"

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pot_friends", force: :cascade do |t|
    t.integer  "pot_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pot_friends", ["friend_id"], name: "index_pot_friends_on_friend_id"
  add_index "pot_friends", ["pot_id"], name: "index_pot_friends_on_pot_id"

  create_table "pots", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "time_10"
    t.boolean  "time_12"
    t.boolean  "time_2"
    t.boolean  "time_4"
    t.boolean  "time_6"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pots", ["location_id"], name: "index_pots_on_location_id"
  add_index "pots", ["user_id"], name: "index_pots_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
