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

require 'test_helper'

class CAssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
