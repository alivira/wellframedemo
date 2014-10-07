class AddIndexToCaremanagersEmail < ActiveRecord::Migration
  def change
  	add_index :care_managers, :email, unique: true
  end
end
