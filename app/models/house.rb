class House < ActiveRecord::Base
  has_many :locations
  # belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :tarifs
end
