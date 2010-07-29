# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100729081506) do

  create_table "medias", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.float    "rating"
    t.integer  "duration"
    t.string   "directed_by"
    t.string   "cast"
    t.string   "genre"
    t.string   "plot"
    t.string   "poster_url"
    t.integer  "user_id"
    t.integer  "media_id"
    t.string   "loaned_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imdb"
    t.integer  "year"
    t.boolean  "wishlist"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :null => false
    t.string   "name",                                  :null => false
    t.string   "crypted_password",                      :null => false
    t.string   "password_salt",                         :null => false
    t.string   "persistence_token",                     :null => false
    t.integer  "login_count",        :default => 0,     :null => false
    t.integer  "failed_login_count", :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",             :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
