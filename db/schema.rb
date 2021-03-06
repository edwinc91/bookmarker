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

ActiveRecord::Schema.define(version: 20170123081831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        null: false
    t.string   "book_type",   null: false
    t.string   "website"
    t.string   "volume"
    t.string   "chapter"
    t.string   "page"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "author"
  end

  add_index "books", ["book_type"], name: "index_books_on_book_type", using: :btree
  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "session_token"
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree

  add_foreign_key "books", "users"
end
