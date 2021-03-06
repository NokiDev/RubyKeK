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

ActiveRecord::Schema.define(version: 20161115135138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string   "comment"
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "concert_id"
    t.index ["concert_id"], name: "index_comments_on_concert_id", using: :btree
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
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "price",       null: false
    t.datetime "bought_date", null: false
    t.integer  "user_id"
    t.integer  "concert_id"
    t.integer "number_of", null:false
    t.index ["concert_id"], name: "index_tickets_on_concert_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "password",                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "adress"
    t.string   "email",                           null: false
    t.string   "phone_number"
    t.text     "description",    default: ""
    t.boolean  "enabled",        default: false
    t.string   "activation_key",                  null: false
    t.string   "status",         default: "none"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "comments", "concerts"
  add_foreign_key "comments", "users"
  add_foreign_key "tickets", "concerts"
  add_foreign_key "tickets", "users"
end
