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
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end
