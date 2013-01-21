class AddWidthToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :width, :string,:default => "150px"
  end
end
