class CreateHousesTarifsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :houses_tarifs, :id => false, :force => true do |t|
      t.integer :house_id, :tarif_id
      t.timestamps
    end
  end

  def self.down
    drop_table :houses_tarifs
  end
end
