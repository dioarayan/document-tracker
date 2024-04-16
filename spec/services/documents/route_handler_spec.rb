require "rails_helper"

describe Documents::RouteHandler do
  subject { described_class.new(destination: destination) }

  let(:user) { cache(:user1, username: "new_user", email: "new_email@test.com") }
  let(:document) { cache(:document1) }
  let(:destination) do
    {
      document_id: document[:id],
      destination_user_id: user[:id],
      remarks: "sample remarks"
    }
  end

  context "when documents are successfully forwarded" do
    it "creates the route record" do
      expect { subject.call }.to change { Route.count }.by(1)
    end
      
    it "creates a new record based on provided params" do
      response = subject.call
      expect(response[:destination_user_id]).to eq user.id
      expect(response[:document_id]).to eq document.id
      expect(response[:remarks]).to eq "sample remarks"
    end
  end
  
  context "when service fails" do
    let(:destination) do
      {
        document_id: 999,
        destination_user_id: 999,
        remarks: "sample remarks"
      }
    end

    it "raises exception if service fails" do
      expect { subject.call }.to raise_error(DocumentForwardingException)
    end
  end
end
