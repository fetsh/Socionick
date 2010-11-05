class AddGeometryToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :geometry, :string
  end

  def self.down
    remove_column :photos, :geometry
  end
end
