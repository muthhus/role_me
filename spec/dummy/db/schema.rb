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

ActiveRecord::Schema.define(:version => 20111012211502) do

  create_table "role_me_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_me_roles", ["name"], :name => "index_role_me_roles_on_name", :unique => true

  create_table "role_me_roles_join", :id => false, :force => true do |t|
    t.integer  "roled_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "role_me_roles_join", ["roled_id", "role_id"], :name => "roled_roles", :unique => true

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
