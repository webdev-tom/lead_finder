require 'rails_helper'

feature "claim lead", %{

  As an authenticated user,
  I want to claim a lead,
  So that other users will know which leads are avilable to them.

    [ ] Can see a button to claim lead
    [ ] Can see a button to unclaim lead
    [ ] Cannot claim lead if already claimed

} do

  let!(:lead) { FactoryGirl.create(:lead) }
  scenario "user claims a lead successfully" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_button "Search"

    click_link "3M"
    click_on "Claim Lead"

    expect(page).to have_content("Lead claimed successfully.")
  end

  let!(:lead) { FactoryGirl.create(:lead) }
  scenario "user unclaims a lead successfully" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_button "Search"

    click_link "3M"
    click_on "Claim Lead"
    click_on "Unclaim Lead"

    expect(page).to have_content("Lead unclaimed successfully.")
  end

  let!(:lead) { FactoryGirl.create(:lead) }
  scenario "user cannot claim already claimed lead" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_button "Search"

    click_link "3M"
    click_on "Claim Lead"

    click_link 'Sign Out'

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test1"
    fill_in 'Last Name', with: "User1"
    fill_in 'Email', with: "testuser1@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    fill_in "Company name", with: lead.company_name
    fill_in "City", with: lead.phys_city
    fill_in "State", with: lead.phys_state
    click_button "Search"

    click_link "3M"

    expect(page).to have_content("This lead has been claimed by another user.")
  end
end
