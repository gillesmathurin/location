class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :house_id
      t.date :date_debut
      t.date :date_fin
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
