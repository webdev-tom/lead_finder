require 'rails_helper'

feature "search leads", %{

  As an authenticated user,
  I want to search via a number of filters,
  So that I can receive the specific leads I need.

    [x] Ability to search via city, state, zip, county, and ownership
    [x] If I do not specify any search terms, I am presented with errors
    [x] If I specify the required information, my search is recorded and
        I am presented with the requested leads

} do

  let!(:lead) { FactoryGirl.create(:lead) }
  scenario "user enters required information and sees leads" do

    visit root_path
    click_on "Browse Leads"
    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_on "Search"

    expect(page).to have_content("3M")
  end

  scenario "user does not enter required information and sees errors" do
    visit root_path

    click_on "Browse Leads"
    click_on "Search"

    expect(page).to have_content("At least one field must be filled!")
  end
end
