class CAsset < ActiveRecord::Base
  attr_accessible :asset_category_id, :bianhao, :last_update_user
  belongs_to :asset_category
  has_many :asset_property_values
end
