class CreatePromoGenerales < ActiveRecord::Migration
  def self.up
    create_table :promo_generales do |t|
      t.string :titre
      t.text :description
      t.date :date_debut
      t.date :date_fin

      t.timestamps
    end
  end

  def self.down
    drop_table :promo_generales
  end
end
