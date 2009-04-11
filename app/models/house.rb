class House < ActiveRecord::Base
  has_many :locations
  # belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tarifs
  
  has_attached_file :overview, :styles => { :medium => '600x600', :thumb => '100x100'}
  has_attached_file :salon, :styles => { :medium => '600x600', :thumb => '100x100'}
  has_attached_file :chambre, :styles => { :medium => '600x600', :thumb => '100x100'}
  has_attached_file :salle_eau, :styles => { :medium => '600x600', :thumb => '100x100'}
  has_attached_file :cuisine, :styles => { :medium => '600x600', :thumb => '100x100'}
  has_attached_file :terrasse, :styles => { :medium => '600x600', :thumb => '100x100'}
end
