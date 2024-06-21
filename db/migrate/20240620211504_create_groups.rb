class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :id_admin 
      t.string :description 
      t.string :photo 
      t.timestamps
    end
  end
end
