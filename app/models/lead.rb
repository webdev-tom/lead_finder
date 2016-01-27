class Lead < ActiveRecord::Base
  belongs_to :user


  geocoded_by :phys_address
  sleep(1)
  after_validation :geocode

  validates :company_id, uniqueness: true, case_sensitive: false
  validates :company_id, numericality: { only_integer: true }

  validates :company_name, presence: true

  validates :phys_address, presence: true

  validates :phys_city, presence: true
  validates_format_of :phys_city, with: /[a-z]/

  validates :phys_state, presence: true

  validates :phys_zip, presence: true
  validates :phys_zip, numericality: { only_integer: true }
  validates :phys_zip, length: { is: 5 }
end
