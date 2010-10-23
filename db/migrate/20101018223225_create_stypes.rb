class CreateStypes < ActiveRecord::Migration
  def self.up
    create_table :stypes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :stypes
  end
end
