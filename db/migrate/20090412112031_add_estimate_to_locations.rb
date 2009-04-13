class AddEstimateToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :estimate, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :locations, :estimate
  end
end
