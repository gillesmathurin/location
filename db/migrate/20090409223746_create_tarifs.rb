class CreateTarifs < ActiveRecord::Migration
  def self.up
    create_table :tarifs do |t|
      t.integer :days_nb
      t.decimal :price
      t.string :nom

      t.timestamps
    end
  end

  def self.down
    drop_table :tarifs
  end
end
