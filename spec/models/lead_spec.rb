require 'rails_helper'

RSpec.describe Lead, type: :model do

  it "validates uniqueness of lead" do
    FactoryGirl.create(:lead)
    should validate_uniqueness_of(:company_id).case_insensitive
  end

  it { should have_valid(:company_name).when('Rand Whitney') }
  it { should_not have_valid(:company_name).when(nil,'') }

  it { should have_valid(:phys_address).when('116 Birch Dr.') }
  it { should_not have_valid(:phys_address).when(nil,'') }

  it { should have_valid(:phys_city).when('Boston') }
  it { should_not have_valid(:phys_city).when(nil,'','45') }

  it { should have_valid(:phys_state).when('MA') }
  it { should_not have_valid(:phys_state).when(nil,'') }

  it { should have_valid(:phys_zip).when('01520') }
  it { should_not have_valid(:phys_zip).when(nil,'','0123','000','abcd') }
end
