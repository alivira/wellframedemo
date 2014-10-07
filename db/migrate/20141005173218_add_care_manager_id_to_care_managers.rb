class AddCareManagerIdToCareManagers < ActiveRecord::Migration
  def change
    add_column :care_managers, :care_manager_id, :integer
  end
end
