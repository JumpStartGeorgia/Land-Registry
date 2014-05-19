class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :type
      t.string :number
      t.datetime :date

      t.timestamps
    end
  end
end
