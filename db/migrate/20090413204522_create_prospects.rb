class CreateProspects < ActiveRecord::Migration
  def self.up
    create_table :prospects do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.string :fax
      t.integer :house_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prospects
  end
end
