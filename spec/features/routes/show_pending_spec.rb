require 'rails_helper'

describe "#Show Pending" do
  let(:user) { cache(:user1) }
  let(:route) { cache(:route1) }

  before do
      login(user)
      click_on "Pending"
  end

  context "when clicking pending button" do
      it "shows all lists of all pending routes" do
          expect(page).to have_content("Pending documents")
            .and have_content("Document name")
      end
  end

end