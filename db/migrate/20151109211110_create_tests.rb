class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :subject
      t.string :topic
      t.date :date
      
      t.timestamps
    end
  end
end
