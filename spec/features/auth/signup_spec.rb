require "rails_helper"

describe "#Showing Profile" do  
  context "when successful signup" do
    it "redirects to profile page after success" do
      visit root_path

      click_on "Sign Up"
      within ".signup-form" do
        fill_in "Username", with: 'user'
        fill_in "Email", with: 'user@test.com'
        fill_in "Password", with: 'password123'
        click_on "Register"
      end

      expect(page).to have_content("Welcome to Document Tracker, user! You have successfully signed in.")
        .and have_content('user')
        .and have_content('user@test.com')
    end
  end

end
