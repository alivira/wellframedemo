class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :id
      t.boolean :active
      t.string :vcode

      t.timestamps
    end
  end
end
