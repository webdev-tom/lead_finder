require 'spec_helper'

feature 'sign in and sign out', %{

      As an unauthenticated user
      I want to sign in
      So that I can search, as well as save and view my search history

        [x] Ability to access an account sign-in page
        [x] If user does not fill out the required fields, or if the credentials are invalid,
            they are presented with errors


      As an authenticated user
      I want to sign out
      So that no one else can view my search history

        [x] Ability to see a sign-out button once successfully signed in
        [x] Clicking this button signs out the user

} do

  scenario 'user signs in with email and password' do
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password, match: :prefer_exact
    click_on 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end

  scenario 'user unsuccessfully signs in' do
    visit root_path
    user2 = FactoryGirl.create(:user)
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: 'passwordwrong', match: :prefer_exact
    click_on 'Log in'

    expect(page).to have_content("Invalid email or password.")
  end

  scenario 'signed in user signs out' do
    user3 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user3.email
    fill_in 'Password', with: user3.password, match: :prefer_exact
    click_on 'Log in'

    visit root_path
    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
  end
end
