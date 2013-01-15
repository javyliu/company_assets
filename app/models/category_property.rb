class CategoryProperty < ActiveRecord::Base
  belongs_to :asset_category
  belongs_to :property
  attr_accessible :asset_category_id, :property_id
  validates_presence_of :asset_category_id,:property_id
end
