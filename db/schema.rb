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

ActiveRecord::Schema.define(:version => 20131116224743) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "publication_date"
    t.text     "tags"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "thumbnail_link"
    t.integer  "volume"
    t.integer  "issue"
    t.string   "download_link"
  end

  create_table "articles_course_packs", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "course_pack_id"
  end

  add_index "articles_course_packs", ["article_id", "course_pack_id"], :name => "index_articles_course_packs_on_article_id_and_course_pack_id"
  add_index "articles_course_packs", ["course_pack_id"], :name => "index_articles_course_packs_on_course_pack_id"

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.string   "privacy"
    t.datetime "postdate"
    t.string   "article"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "course_pack_id"
  end

  create_table "course_packs", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.integer  "owner_id"
    t.text     "articles"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.boolean  "public"
    t.text     "tags"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "publication_date"
    t.text     "tags"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "username"
  end

end
