class AddHospitalIdToCareManagers < ActiveRecord::Migration
  def change
    add_column :care_managers, :hospital_id, :integer
  end
end
