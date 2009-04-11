class Location < ActiveRecord::Base
  belongs_to :house
  belongs_to :tarif
  belongs_to :customer
end
