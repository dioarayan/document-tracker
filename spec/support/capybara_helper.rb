module CapybaraHelper
  def login(user)
    visit root_path

    click_on "Log In"
    within ".login-form" do
      fill_in "Email", with: user.email
      fill_in "Password", with: "averysecurepassword"
      click_button "Log In"
    end

    expect(page).to have_content("Logged in successfully")
      .and have_content("#{user.username}")
  end

  def logout(user)
      visit root_path

      click_button "Log Out"
      expect(page).to have_content("You are logged out")
  end

  def signup(user)
    visit signup_path

    click_on "Sign Up"
    within ".signup-form" do
      fill_in "Username", with: user.username
      fill_in "Email", with: user.email
      fill_in "Password", with: "averysecurepassword"
      click_button "Create User"
    end

    expect(page).to have_content("Welcome to Document Tracker, test! You have successfully signed in.")
      .and have_content("#{user.username}")
  end

  def create_doc(document)
    visit documents_path

    click_on "New log"
    within ".new_document" do
      fill_in  "Category", with: document.name
      click_button "Create Document"
    end

    expect(page).to have_content("You have successfully created a new document")
      .and have_content("#{document.name}")
  end
  
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end
