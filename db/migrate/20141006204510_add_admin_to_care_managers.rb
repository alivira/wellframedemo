class AddAdminToCareManagers < ActiveRecord::Migration
  def change
    add_column :care_managers, :admin, :boolean
  end
end
