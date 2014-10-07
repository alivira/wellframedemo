class AddCareManagerIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :care_manager_id, :integer
  end
end
