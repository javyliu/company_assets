# == Schema Information
#
# Table name: asset_categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class AssetCategory < ActiveRecord::Base
  attr_accessible :name,:category_property_ids
  has_many :category_properties,:dependent => :delete_all
  has_many :properties,:through => :category_properties
  has_many :c_assets,:inverse_of => :asset_category
  validates_presence_of :name
  #accepts_nested_attributes_for :category_properties#, :reject_if => proc { |attributes| attributes['name'].blank? }

  
end
