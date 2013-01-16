class CAsset < ActiveRecord::Base
  default_scope order("id desc")
  belongs_to :asset_category,:inverse_of => :c_assets
  has_many :asset_property_values,:inverse_of => :c_asset,:dependent => :delete_all
  validates_presence_of :bianhao,:asset_category_id

  accepts_nested_attributes_for :asset_property_values
  attr_accessible :asset_category_id, :bianhao, :last_update_user,:asset_property_values_attributes
end
