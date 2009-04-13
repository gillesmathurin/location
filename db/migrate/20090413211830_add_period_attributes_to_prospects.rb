class AddPeriodAttributesToProspects < ActiveRecord::Migration
  def self.up
    add_column :prospects, :date_debut, :date
    add_column :prospects, :date_fin, :date
  end

  def self.down
    remove_column :prospects, :date_fin
    remove_column :prospects, :date_debut
  end
end
