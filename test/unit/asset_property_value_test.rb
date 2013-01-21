# == Schema Information
#
# Table name: asset_property_values
#
#  id          :integer          not null, primary key
#  property_id :integer
#  c_asset_id  :integer
#  str_value   :string(255)
#  int_value   :integer
#

require 'test_helper'

class AssetPropertyValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
