require 'rails_helper'

feature "create lead", %{

  As an authenticated user,
  I want to create a new lead,
  So that I can keep the database up to date.

    [x] Can see a button to create new lead
    [x] Can see fields to enter new lead

} do

  scenario "user creates a lead successfully" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    click_on "Enter Site"
    click_on "Create a Lead →"
    fill_in "*Company Name", with: "Launch Academy"
    fill_in "*Address", with: "33 Harrison Ave."
    fill_in "*City", with: "Boston"
    select "MA", from: "*State"
    fill_in "*Zip Code", with: "02111"

    click_on "Create Lead"

    expect(page).to have_content("Launch Academy Details:")
  end

  scenario "user creates a lead unsuccessfully" do

    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Tester"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser1@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    click_on "Enter Site"
    click_on "Create a Lead →"
    fill_in "*Company Name", with: "Launch Academy"
    fill_in "*Address", with: "33 Harrison Ave."
    select "MA", from: "*State"
    fill_in "*Zip Code", with: "02111"
    click_on "Create Lead"

    expect(page).to have_content("Create a Lead")
    expect(page).to_not have_content("Search Leads")
  end
end
