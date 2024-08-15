require "rails_helper"

describe "Create new document", js: true do
  let(:user1) { cache(:user1) }
  let(:document) { cache(:document1, user: user1) }
  let!(:category) { cache(:category1) }
  let!(:section) { cache(:section1) }

  before do
    login(user1)
    visit documents_path
    click_on "New log"
  end  

  it "creates a new document" do
    expect(page).to have_css("div#exampleModal")
    within ".new_document" do
      select  "Category 1", from: "document_category_id" 
      select  "Section name", from: "document_section_id" 
      click_button "Create Document"
      fill_in "document_name", with: "Some name" 
      fill_in "document_description", with: "Some description" 
      click_button "Create Document"
    end
    expect(page).to have_content("You have successfully created a new document")
      .and have_content("Document Information:")
  end
end