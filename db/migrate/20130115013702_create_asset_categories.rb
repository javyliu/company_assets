class CreateAssetCategories < ActiveRecord::Migration
  def change
    create_table :asset_categories do |t|
      t.string :name
    end
  end
end
