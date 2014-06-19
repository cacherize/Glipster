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

ActiveRecord::Schema.define(:version => 20140619042415) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comment_likes", :force => true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.string   "message",    :limit => 512
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "developers", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "archived_at"
  end

  create_table "failed_logins", :force => true do |t|
    t.string   "requester"
    t.integer  "attempts"
    t.datetime "attempted_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "faqs", :force => true do |t|
    t.string   "question",   :limit => 512
    t.string   "answer",     :limit => 2048
    t.integer  "position",                   :default => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "featured_category_games", :force => true do |t|
    t.integer  "category_id"
    t.integer  "game_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "featured_images", :force => true do |t|
    t.string   "image_uid"
    t.string   "title"
    t.string   "link"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "position",   :default => 0
  end

  create_table "game_categories", :force => true do |t|
    t.integer  "game_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "game_sequels", :force => true do |t|
    t.integer  "sequel_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.integer  "weekly_plays",  :default => 0
    t.integer  "monthly_plays", :default => 0
    t.integer  "daily_plays",   :default => 0
  end

  create_table "levels", :force => true do |t|
    t.integer  "stage"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "game_id"
    t.integer  "recommendation_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "reputations", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
  end

  create_table "support_tickets", :force => true do |t|
    t.string   "email"
    t.string   "reason"
    t.string   "message",      :limit => 2048
    t.boolean  "stickied"
    t.datetime "archived_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "other_reason"
    t.string   "name"
  end

  create_table "uploads", :force => true do |t|
    t.string   "title"
    t.string   "game"
    t.string   "note",       :limit => 2048
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
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
    t.integer  "plays",                  :default => 0
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
