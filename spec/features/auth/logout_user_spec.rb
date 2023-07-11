require "rails_helper"

describe "Logout" do
  let(:user) { create(:user1) }

  before do
    login(user)
  end

  context "when logout button is clicked" do
    it "should display a proper flash message" do
      click_on "Log Out"
      expect(page).to have_content("You are logged out")
    end
  end

end