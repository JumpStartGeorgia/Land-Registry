class Document < ActiveRecord::Base

  belongs_to :application

  validates :name, :type, :number, presence: true

end
