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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130918052244) do

  create_table "bills", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entity_id"
    t.string   "name"
    t.decimal  "amount",       :precision => 8, :scale => 2
    t.string   "recur_period"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "exemptions"
    t.datetime "due_date"
  end

  create_table "bills_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "bill_id"
  end

  create_table "entities", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entities_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "entity_id"
  end

  create_table "invites", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "inviter_id",                    :null => false
    t.integer  "bill_id",                       :null => false
    t.boolean  "expired",    :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
