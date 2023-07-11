require "rails_helper"

describe "#Showing List of Users" do
  let(:user) { cache(:user1) }

  before do
    login(user)
  end   

  context "when clicking Users tab" do
    it "renders list of users" do
      click_on "Users"
      expect(page).to have_content("List of users")
        .and have_content(user.username)
        .and have_content(user.email)
        .and have_link("Show")
        .and have_link("Edit")
        .and have_link("Delete")
    end
  end
end