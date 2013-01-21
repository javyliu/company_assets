# == Schema Information
#
# Table name: data_centers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  contract_no     :string(255)
#  kefu_tel        :string(255)
#  other_contact   :string(255)
#  ems_address     :string(255)
#  map             :string(255)
#  device_no       :string(100)
#  space           :string(100)
#  bandwidth       :string(100)
#  port_num        :string(100)
#  ip              :string(100)
#  exchange_device :string(255)
#  fee             :string(255)
#  remark          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class DataCenter < ActiveRecord::Base
  attr_accessible :bandwidth, :contract_no, :device_no, :ems_address, :exchange_device, :fee, :ip, :kefu_tel, :map, :name, :other_contact, :port_num, :remark, :space
end
