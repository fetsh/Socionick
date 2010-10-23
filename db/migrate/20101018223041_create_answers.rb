class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :user_id
      t.integer :person_id
      t.integer :stype_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
