class Lead < ActiveRecord::Base
  validates :company_id, uniqueness: true, case_sensitive: false
end
