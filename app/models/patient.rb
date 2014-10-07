class Patient < ActiveRecord::Base
  attr_accessible :active, :patientID, :vcode
  belongs_to :care_manager
end
