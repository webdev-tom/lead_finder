class Lead < ActiveRecord::Base
  belongs_to :user

  validates :company_id, uniqueness: true, case_sensitive: false
end
