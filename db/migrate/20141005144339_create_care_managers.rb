class CreateCareManagers < ActiveRecord::Migration
  def change
    create_table :care_managers do |t|
      t.string :name
      t.string :email
      t.string :hospital
      t.integer :patients

      t.timestamps
    end
  end
end
