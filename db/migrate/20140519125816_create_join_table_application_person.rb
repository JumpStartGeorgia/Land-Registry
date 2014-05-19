class CreateJoinTableApplicationPerson < ActiveRecord::Migration
  def change
    create_join_table :applications, :people do |t|
      # t.index [:application_id, :person_id]
      # t.index [:person_id, :application_id]
    end
  end
end
