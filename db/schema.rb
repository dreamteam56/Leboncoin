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

ActiveRecord::Schema.define(version: 20140307102647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "t_etudiant", id: false, force: true do |t|
    t.string "pk_num_secu", limit: 13, null: false
    t.string "ck_num_etu",  limit: 20, null: false
    t.string "nom",         limit: 50, null: false
    t.string "prenom",      limit: 50, null: false
  end

  add_index "t_etudiant", ["ck_num_etu"], name: "t_etudiant_ck_num_etu_key", unique: true, using: :btree

  create_table "t_inscription", id: false, force: true do |t|
    t.string "pk_code_ue",  limit: 4,  null: false
    t.string "fk_code_etu", limit: 13, null: false
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
