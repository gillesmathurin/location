class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :nom
      t.string :prenom
      t.string :adresse
      t.string :zip
      t.string :ville
      t.string :telephone
      t.string :email
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
