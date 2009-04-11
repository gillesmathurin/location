class Customer < ActiveRecord::Base
  has_many :locations
end
