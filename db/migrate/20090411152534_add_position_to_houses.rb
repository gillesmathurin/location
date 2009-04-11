class AddPositionToHouses < ActiveRecord::Migration
  def self.up
    add_column :houses, :position, :integer
  end

  def self.down
    remove_column :houses, :position
  end
end
