class CreateHouses < ActiveRecord::Migration
  def self.up
    create_table :houses do |t|
      t.string :nom
      t.string :adresse
      t.string :zip
      t.string :ville
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :houses
  end
end
