class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :year
      t.string :contact_email
      t.text :opinion
      
      t.timestamps
    end
  end
end
