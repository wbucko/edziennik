class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :result
      
      t.timestamps
    end
  end
end
