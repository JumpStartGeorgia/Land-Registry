class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :person_number
      t.string :address
      t.string :role
      t.string :type

      t.timestamps
    end
  end
end
