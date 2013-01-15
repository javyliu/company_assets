class CreateCheckOptions < ActiveRecord::Migration
  def change
    create_table :check_options do |t|
      t.references :property
      t.string :item_name
    end
    add_index :check_options, :property_id
  end
end
