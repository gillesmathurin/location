class Location < ActiveRecord::Base
  belongs_to :house
  belongs_to :tarif
  belongs_to :customer
  
  accepts_nested_attributes_for :customer
  
  named_scope :for_the_period, lambda { |date_debut, date_fin| { :conditions => ['(date_debut <=? and date_fin >=?) OR (date_fin between ? and ?) OR (date_debut between ? and ?)', date_debut, date_fin, date_debut, date_fin, date_debut, date_fin] } }
  
  def calculate_price
    duration = (self.date_fin - self.date_debut).to_i
    tarif_journalier = self.house.tarifs.first(:conditions => ['days_nb = ?', 1])
    tarif_hebdomadaire = self.house.tarifs.first(:conditions => ['days_nb between ? and ?', 5, 7])
    
    case duration
    when 1..7
      self.estimate = (duration * tarif_journalier.price)
    when 8..28
      self.estimate = ((duration/tarif_hebdomadaire.days_nb) * tarif_hebdomadaire.price) + ((duration % tarif_hebdomadaire.days_nb) * tarif_journalier.price)
    else
      tarif_mensuel = self.house.tarifs.first(:conditions => ['days_nb between ? and ?', 29, 31])
      estimate_part_1 = (duration/tarif_mensuel.days_nb) * tarif_mensuel.price
      modulo = (duration % tarif_mensuel.days_nb)
      case modulo
      when  1..7
        estimate_part_2 = modulo * tarif_journalier.price
      when 8..28
        estimate_part_2 = ((modulo/tarif_hebdomadaire.days_nb) * tarif_hebdomadaire.price) + ((modulo % tarif_hebdomadaire.days_nb) * tarif_journalier.price)
      end
      self.estimate = estimate_part_1 + estimate_part_2
    end
    
    self.update_attribute(:estimate, estimate)
  end
  
end
