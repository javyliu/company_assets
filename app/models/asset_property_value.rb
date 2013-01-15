class AssetPropertyValue < ActiveRecord::Base
  belongs_to :property
  belongs_to :c_asset
  attr_accessible :property_id,:c_asset_id,:int_value, :str_value
end
