require "rails_helper"

describe Document do
  let(:document) { cache(:document1) }

  shared_examples "an invalid record" do
    it { is_expected.not_to be_valid }
  end

  context "when the name property is blank" do
    subject { build(:document1, name: '') }

    it_behaves_like "an invalid record"
  end

  context "when the name property has less than 6 characters" do
    subject { build(:document1, name: 'less') }

    it_behaves_like "an invalid record"
  end

  context "when the description property exceeds 100 characters" do
    let(:description) { (0...101).map { ("a".."z").to_a[rand(26)] }.join }
    subject { build(:document1, description: description) }

    it_behaves_like "an invalid record"
  end
end
