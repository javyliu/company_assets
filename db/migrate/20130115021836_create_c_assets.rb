class CreateCAssets < ActiveRecord::Migration
  def change
    create_table :c_assets do |t|
      t.string :bianhao,:limit => 50
      t.integer :asset_category_id
      t.string :last_update_user,:limit => 50

      t.timestamps
    end
  end
end
