# == Schema Information
#
# Table name: category_properties
#
#  id                :integer          not null, primary key
#  asset_category_id :integer
#  property_id       :integer
#

class CategoryProperty < ActiveRecord::Base
  belongs_to :asset_category
  belongs_to :property
  attr_accessible :asset_category_id, :property_id
  validates_presence_of :asset_category_id,:property_id
end
