class Patients < ActiveRecord::Migration
def change
    create_table :patients do |t|
      t.string :patientID
      t.boolean :active
      t.string :vcode

      t.timestamps
    end
  end
end
