require 'rails_helper'

feature 'user edits/deletes info', %{

      As an authenticated user
      I want to update my information
      So that I can keep my profile up to date

        [x] Ability to access account edit page while successfully signed in
        [x] If user tries to clear required fields and save,
            they are presented with errors


      As an authenticated user
      I want to delete my account
      So that my information is no longer retained by the app

        [x] Ability to click a ‘delete account’ button that removes the user’s
            account from the database

} do

  scenario 'user edits user info successfully' do
    visit root_path

    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    click_link 'Edit Info'
    fill_in 'Email', with: "newemail@gmail.com"
    fill_in "Current password", with: "password"
    click_on 'Update'
    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario 'user deletes user info successfully' do

    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: "Test"
    fill_in 'Last Name', with: "User"
    fill_in 'Email', with: "testuser@gmail.com"
    fill_in 'Password', with: "password", match: :prefer_exact
    fill_in 'Confirm Password', with: "password"
    click_button 'Sign Up'

    click_on 'Edit Info'
    click_link 'Cancel my account'
    expect(page).to have_content("Your account has been successfully cancelled")
  end
end
