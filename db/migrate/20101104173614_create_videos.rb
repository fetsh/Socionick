class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :person_id
      t.text :video_code

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
