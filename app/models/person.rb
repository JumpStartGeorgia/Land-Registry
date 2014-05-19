class Person < ActiveRecord::Base

  has_and_belongs_to_many :applications

  validates :name, :person_number, :role, :type, presence: true

end
