class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :temat
      t.date :data
      t.integer :ocena

      t.timestamps
    end
  end
end
