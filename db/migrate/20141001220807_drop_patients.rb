class DropPatients < ActiveRecord::Migration
  def change
  	drop_table :patients
  end
end
