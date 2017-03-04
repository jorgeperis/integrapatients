class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :owner
      t.string :section
      t.text :history
      t.string :updated_by
      t.timestamps
    end
  end
end
