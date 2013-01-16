class CreateDataCenters < ActiveRecord::Migration
  def change
    create_table :data_centers do |t|
      t.string :name
      t.string :contract_no
      t.string :kefu_tel
      t.string :other_contact
      t.string :ems_address
      t.string :map
      t.string :device_no,:limit => 100
      t.string :space,:limit => 100
      t.string :bandwidth,:limit => 100
      t.string :port_num,:limit => 100
      t.string :ip,:limit => 100
      t.string :exchange_device
      t.string :fee
      t.string :remark

      t.timestamps
    end
  end
end
