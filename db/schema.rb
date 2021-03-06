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

ActiveRecord::Schema.define(version: 20150924135909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "borrows", force: :cascade do |t|
    t.integer  "collection_id"
    t.integer  "user_id"
    t.datetime "in_date"
    t.datetime "out_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "borrows", ["collection_id"], name: "index_borrows_on_collection_id", using: :btree
  add_index "borrows", ["user_id"], name: "index_borrows_on_user_id", using: :btree

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "available",  default: true, null: false
  end

  add_index "collections", ["book_id"], name: "index_collections_on_book_id", using: :btree
  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "borrows", "collections"
  add_foreign_key "borrows", "users"
  add_foreign_key "collections", "books"
  add_foreign_key "collections", "users"
end
