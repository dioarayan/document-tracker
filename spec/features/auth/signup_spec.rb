require "rails_helper"

describe "#Showing Profile" do  
  let(:user) { cache(:user1) }

  before do
    signup(user)
  end

  context "when successful signup" do
    it "redirects to profile page after success" do
      expect(page).to have_content("Showing User Profile")
      .and have_content(user.username)
      .and have_content(user.email)
      .and have_link("Edit")
      .and have_link("Delete your profile")
    end
  end

end
