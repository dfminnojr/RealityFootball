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

ActiveRecord::Schema.define(:version => 20130903212119) do

  create_table "banks", :force => true do |t|
    t.integer  "balance"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "total_point_amount"
    t.string   "rank"
    t.integer  "star_amount"
    t.integer  "point_marker"
  end

  create_table "game_changes", :force => true do |t|
    t.string   "possession"
    t.string   "score"
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "home_team"
    t.string   "away_team"
    t.string   "start_time"
    t.string   "game_date"
    t.string   "score"
    t.string   "winner"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "week"
    t.text     "venue_info"
    t.integer  "home_qb_stat"
    t.integer  "away_qb_stat"
    t.integer  "home_rb_stat"
    t.integer  "away_rb_stat"
  end

  create_table "games_users", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "response_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.integer  "game_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "question_1"
    t.string   "question_2"
    t.string   "question_3"
    t.string   "correct_answer"
    t.string   "question_4"
    t.string   "question_5"
    t.string   "question_6"
  end

  create_table "ranks", :force => true do |t|
    t.string   "title"
    t.integer  "star_amount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "rank"
    t.string   "picture"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "remember_token"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.integer  "point_amount"
    t.boolean  "admin",                 :default => false
    t.integer  "total_points"
  end

  create_table "wagers", :force => true do |t|
    t.integer  "point_amount"
    t.string   "result"
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "response"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "game_id"
    t.string   "status"
  end

end
