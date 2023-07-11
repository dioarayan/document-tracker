require "rails_helper"

describe Route do
  
  shared_examples "an invalid record" do
    it { is_expected.not_to be_valid }
  end

  context "when the remarks exceeds 100 characters" do
    let(:remarks) { (0...101).map { ("a".."z").to_a[rand(26)] }.join }

    it_behaves_like "an invalid record"
  end

end
