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

ActiveRecord::Schema.define(:version => 20130115031207) do

  create_table "asset_categories", :force => true do |t|
    t.string "name"
  end

  create_table "asset_property_values", :force => true do |t|
    t.integer "property_id"
    t.integer "c_asset_id"
    t.string  "str_value"
    t.string  "int_value"
  end

  add_index "asset_property_values", ["c_asset_id"], :name => "index_asset_property_values_on_c_asset_id"
  add_index "asset_property_values", ["property_id"], :name => "index_asset_property_values_on_property_id"

  create_table "c_assets", :force => true do |t|
    t.string   "bianhao",           :limit => 50
    t.integer  "asset_category_id"
    t.string   "last_update_user",  :limit => 50
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "category_properties", :force => true do |t|
    t.integer "asset_category_id"
    t.integer "property_id"
  end

  create_table "check_options", :force => true do |t|
    t.integer "property_id"
    t.string  "item_name"
  end

  add_index "check_options", ["property_id"], :name => "index_check_options_on_property_id"

  create_table "properties", :force => true do |t|
    t.string  "name"
    t.integer "style"
  end

end
