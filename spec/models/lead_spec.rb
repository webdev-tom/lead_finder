require 'rails_helper'

RSpec.describe Lead, type: :model do

it "validates uniqueness of lead" do
  FactoryGirl.create(:lead)
    should validate_uniqueness_of(:company_id).case_insensitive
  end
end
