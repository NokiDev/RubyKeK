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

ActiveRecord::Schema.define(version: 20161115135139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.string  "comment"
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "concerts", force: :cascade do |t|
    t.string  "name"
    t.date    "date"
    t.integer "remaining_tickets"
    t.integer "price"
    t.string  "style"
    t.string  "address"
    t.string  "description"
    t.integer "comment_id"
    t.index ["comment_id"], name: "index_concerts_on_comment_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "concert_id"
    t.index ["concert_id"], name: "index_tickets_on_concert_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.index ["ticket_id"], name: "index_transactions_on_ticket_id", using: :btree
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "adress"
    t.string   "mail"
    t.string   "phone_number"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "concerts", "comments"
  add_foreign_key "tickets", "concerts"
  add_foreign_key "transactions", "tickets"
  add_foreign_key "transactions", "users"
end
