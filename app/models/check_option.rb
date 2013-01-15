class CheckOption < ActiveRecord::Base
  belongs_to :property
  attr_accessible :item_name,:property_id
end
