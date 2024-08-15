require "rails_helper"

describe "#Showing Dashboard" do
  context "when visiting dashboard" do
    it "shows all the elements" do
      visit dashboard_path

      expect(page).to have_content("Pending")
        .and have_content("Processing")
        .and have_content("Completed")
    end
  end
end