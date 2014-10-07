class AddPasswordDigestToCareManagers < ActiveRecord::Migration
  def change
    add_column :care_managers, :password_digest, :string
  end
end
