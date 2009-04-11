class AddDescriptionToHouses < ActiveRecord::Migration
  def self.up
    add_column :houses, :description, :text
  end

  def self.down
    remove_column :houses, :description
  end
end
