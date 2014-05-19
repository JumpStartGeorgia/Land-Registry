class Application < ActiveRecord::Base

  has_and_belongs_to_many :persons
  has_many :documents

  validates :reg_number, :app_number, :cadastral_code, presence: true

end
