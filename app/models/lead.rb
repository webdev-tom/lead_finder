class Lead < ActiveRecord::Base

validates :company_id, uniqueness: true
end
