class Hospital < ActiveRecord::Base
  has_many :care_managers
  attr_accessible :name
end
