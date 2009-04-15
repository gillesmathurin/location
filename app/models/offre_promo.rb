class OffrePromo < ActiveRecord::Base
  belongs_to :house
  
  named_scope :valid, :conditions => ['date_debut >= ? || date_fin >= ?', Date.today, Date.today]
  
end
