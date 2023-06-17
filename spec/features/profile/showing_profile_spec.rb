require "rails_helper"

describe "#Showing Profile" do
  let(:user1) { cache(:user1) }

  before do
    login(user1)
  end

  context "when successful login" do
    it "redirects to profile page after success" do
      expect(page).to have_content("Showing User Profile")
        .and have_content(user1.username)
        .and have_content(user1.email)
        .and have_link("Edit")
        .and have_link("Delete your profile")
    end
  end
end
