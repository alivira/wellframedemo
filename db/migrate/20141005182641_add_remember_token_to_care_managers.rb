class AddRememberTokenToCareManagers < ActiveRecord::Migration
  def change
  	add_column :care_managers, :remember_token, :string
    add_index  :care_managers, :remember_token
  end
end
