require 'rails_helper'

feature "sign up", %{

  As a prospective user
  I want to create an account
  So that I can search, as well as save and view my search history

    [x] Ability to access an account creation page
    [x] If user does not fill out the required fields, they are
        presented with errors

} do

  scenario "user specifies required info and user account is created" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Confirm Password', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content("Welcome!
    Your account was created successfully."
                                )
    expect(page).to have_content("Sign Out")
  end

  scenario "user does not specify required info" do

    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

  scenario "user password and confirmation do not match" do
    user1 = FactoryGirl.build(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: user1.first_name
    fill_in 'Last Name', with: user1.last_name
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "passwrd"
    click_button 'Sign Up'

    expect(page).to have_content("doesn't match Password")
  end
end
