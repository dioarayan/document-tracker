require "rails_helper"

describe "#Document route", js: true do
  let(:user1) { cache(:user1) }
  let!(:secretary) { cache(:secretary) }
  let(:document) { cache(:document1, user: user1)}

  context "when forwarding a document" do
    before do
      login(user1)
      visit "/documents/#{document.id}"
      allow_any_instance_of(Documents::RouteHandler).to receive(:call)
      click_on "Forward to"
      expect(find(:xpath, "/html/body/main/turbo-frame/div/div/div/div[2]/form/div[1]/select")).to have_content("Forward to")
      select "secretary", from: "Destination user"
      fill_in "Remarks", with: "some description"
      click_on "Send"
    end

    it "routes the document" do
      expect(page).to have_content("You have successfully routed a document")
    end
  end

  context "when responding to document received" do
    let(:route1) { cache(:route1, document: document, destination_user: secretary) }

    before do
      document.update_attribute(:status, 1)
      route1.update_attribute(:state, 0)
      login(secretary)
      visit pending_path
    end

      it "contains the received document" do
        expect(page).to have_content("Pending documents")
          .and have_content("Document name")
      end

      context "when accepting document" do
        before do
          find("div#route_#{route1.id}").click
        end

        it "displays the document information" do
          expect(page).to have_content("Document Information:")
            .and have_content("Document name")
            .and have_content("This is a document description")
            .and have_content("Category 1")
            .and have_content("forwarded")
            .and have_content("processing")
        end

        context "when accepting document" do
          it "accepts document" do
            click_on "Accept"
            expect(page).to have_content("You just accepted a document!")
              .and have_content("Processing")
          end
        end

        context "when declining a document" do
          it "accepts document" do
            click_on "Decline"
            expect(page).to have_content("You have declined a document")
              .and have_content("Processing")
          end
        end
      end
    end
end
