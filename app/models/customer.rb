class Customer < ActiveRecord::Base
  has_many :locations
  
  def nom_prenom
    return nom + " " + prenom
  end
end
