class DataCenter < ActiveRecord::Base
  attr_accessible :bandwidth, :contract_no, :device_no, :ems_address, :exchange_device, :fee, :ip, :kefu_tel, :map, :name, :other_contact, :port_num, :remark, :space
end
