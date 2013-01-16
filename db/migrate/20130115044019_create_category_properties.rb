class CreateCategoryProperties < ActiveRecord::Migration
  def change
    create_table :category_properties,:force => true do |t|
      t.references :asset_category
      t.references :property
    end
    add_index :category_properties, :asset_category_id
    add_index :category_properties, :property_id
  end
end
