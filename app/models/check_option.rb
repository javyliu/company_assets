# == Schema Information
#
# Table name: check_options
#
#  id          :integer          not null, primary key
#  property_id :integer
#  item_name   :string(255)
#

class CheckOption < ActiveRecord::Base
  belongs_to :property
  attr_accessible :item_name,:property_id
end
