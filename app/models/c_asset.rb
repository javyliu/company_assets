# == Schema Information
#
# Table name: c_assets
#
#  id                :integer          not null, primary key
#  bianhao           :string(50)
#  asset_category_id :integer
#  last_update_user  :string(50)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CAsset < ActiveRecord::Base
  default_scope order("id desc")
  belongs_to :asset_category,:inverse_of => :c_assets
  has_many :asset_property_values,:inverse_of => :c_asset,:dependent => :delete_all
  validates_presence_of :bianhao,:asset_category_id

  accepts_nested_attributes_for :asset_property_values
  attr_accessible :asset_category_id, :bianhao, :last_update_user,:asset_property_values_attributes
end
