require 'rails_helper'

feature "search leads", %{

  As an authenticated user,
  I want to view a list of filtered leads,
  So that I can sell my product.

    [ ] Can see a list of filtered leads
    [ ] Clicking on a lead will bring the user to it’s
        corresponding show page for more information

} do

  let!(:lead) { FactoryGirl.create(:lead) }

  scenario "user can see a list and click on a lead to see more information" do

    visit root_path
    fill_in "Company name", with: "3M"
    fill_in "City", with: "Rockland"
    fill_in "State", with: "MA"
    click_button "Search"

    click_link "3M"

    expect(page).to have_content("3M Details")
    expect(page).to have_content("Employees on Site")
  end
end
