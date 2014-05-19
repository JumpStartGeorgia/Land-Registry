class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :reg_number
      t.string :app_number
      t.string :service_type
      t.float :paid_amount
      t.datetime :reg_date
      t.string :bank_info
      t.datetime :paid_date
      t.string :service_duration
      t.string :property_address
      t.string :cadastral_code
      t.text :additional_info

      t.timestamps
    end
  end
end
