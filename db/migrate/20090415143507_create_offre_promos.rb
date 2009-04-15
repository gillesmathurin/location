class CreateOffrePromos < ActiveRecord::Migration
  def self.up
    create_table :offre_promos do |t|
      t.string :titre
      t.text :description
      t.date :date_debut
      t.date :date_fin
      t.integer :house_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offre_promos
  end
end
