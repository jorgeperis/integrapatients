class AddUserReferenceToPatient < ActiveRecord::Migration[5.0]
  def change
    add_reference :patients, :user
  end
end
