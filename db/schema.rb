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

ActiveRecord::Schema.define(:version => 20140419013144) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "developers", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "archived_at"
  end

  create_table "featured_category_games", :force => true do |t|
    t.integer  "category_id"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "game_categories", :force => true do |t|
    t.integer  "game_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "controls"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "flash_file"
    t.string   "image_uid"
    t.integer  "developer_id"
    t.integer  "width"
    t.integer  "height"
    t.integer  "plays",         :default => 0
    t.boolean  "featured",      :default => false
    t.integer  "weekly_plays"
    t.integer  "monthly_plays"
  end

  create_table "reputations", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.boolean  "admin",                  :default => false
    t.boolean  "activated",              :default => false
    t.string   "password_digest"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "image_uid"
  end

end
