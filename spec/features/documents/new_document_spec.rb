require "rails_helper"

describe "#New Document" do 
    let(:user1) {cache(:user1)}
    let(:document1) {cache(:document1)}

    before do
        login(user1)
        create_doc(:document1)
    end

    context "when successful creation of document" do
        it "redirects to show document after success" do
            expect(page).to have_content("You have successfully created a new document")
                .and have_content(document1.name)
                .and have_content(document1.description)
                .and have_link("Forward to")
                .and have_link("Edit")
                .and have_link("Delete")
        end
    end
end