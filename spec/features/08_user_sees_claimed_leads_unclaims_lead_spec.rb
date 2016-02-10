require 'rails_helper'

feature "view claimed lead", %{

  As an authenticated user,
  I want to see my claimed leads,
  So that I know which leads I'm currently working with.

    [x] Can see a button to view claimed leads
    [x] Can see a list of claimed leads
    [x] Can unclaim lead directly from list

} do

  let!(:lead) { FactoryGirl.create(:lead) }
  scenario "user views claimed leads successfully" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    click_on "Enter Site"
    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_on "Search"

    click_link "3M"
    click_on "Claim Lead"

    click_link "← Return to Search"
    click_on "View Claimed Leads →"

    expect(page).to have_content("3M")
  end

  let!(:lead) { FactoryGirl.create(:lead) }
  scenario "user unclaims a lead from list successfully" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    click_on "Enter Site"
    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_on "Search"

    click_link "3M"
    click_on "Claim Lead"

    click_link "← Return to Search"
    click_on "View Claimed Leads →"
    click_on "Unclaim Lead"

    expect(page).to have_content("Lead unclaimed successfully.")
  end
end
