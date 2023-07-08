require "rails_helper"

describe "#Showing documents" do
  let(:document1) { cache(:document1) }

  context "when clicking my logs" do
    it "route to document page" do
      expect(page).to have_content("Showing User Profile")
        .and have_content(user1.username)
        .and have_content(user1.email)
        .and have_link("Edit")
        .and have_link("Delete your profile")
    end
  end

end