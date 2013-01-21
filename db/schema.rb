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

ActiveRecord::Schema.define(:version => 20130121070439) do

  create_table "asset_categories", :force => true do |t|
    t.string "name"
  end

  create_table "asset_property_values", :force => true do |t|
    t.integer "property_id"
    t.integer "c_asset_id"
    t.string  "str_value"
    t.integer "int_value"
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

  add_index "category_properties", ["asset_category_id"], :name => "index_category_properties_on_asset_category_id"
  add_index "category_properties", ["property_id"], :name => "index_category_properties_on_property_id"

  create_table "check_options", :force => true do |t|
    t.integer "property_id"
    t.string  "item_name"
  end

  add_index "check_options", ["property_id"], :name => "index_check_options_on_property_id"

  create_table "data_centers", :force => true do |t|
    t.string   "name"
    t.string   "contract_no"
    t.string   "kefu_tel"
    t.string   "other_contact"
    t.string   "ems_address"
    t.string   "map"
    t.string   "device_no",       :limit => 100
    t.string   "space",           :limit => 100
    t.string   "bandwidth",       :limit => 100
    t.string   "port_num",        :limit => 100
    t.string   "ip",              :limit => 100
    t.string   "exchange_device"
    t.string   "fee"
    t.string   "remark"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "properties", :force => true do |t|
    t.string  "name"
    t.integer "style"
    t.string  "width", :default => "200px"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
