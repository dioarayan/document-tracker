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

  context "when edit button clicked" do
    it "renders edit form" do
      click_on "Edit"
      expect(page).to have_content("Edit user")
      .and have_field('Username', with: user1.username)
      .and have_field('Email', with: user1.email)
      .and have_button("Register")
    end
  end

end


