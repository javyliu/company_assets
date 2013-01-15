class CreateAssetPropertyValues < ActiveRecord::Migration
  def change
    create_table :asset_property_values do |t|
      t.references :property
      t.references :c_asset
      t.string :str_value
      t.string :int_value
    end
    add_index :asset_property_values, :property_id
    add_index :asset_property_values, :c_asset_id
  end
end
