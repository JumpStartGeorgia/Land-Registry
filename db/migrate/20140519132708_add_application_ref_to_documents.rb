class AddApplicationRefToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :application, index: true
  end
end
