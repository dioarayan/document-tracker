require "rails_helper"

describe Document do
  let(:user) { cache(:user1) }
  subject { build(:document1, user: user) }

  shared_examples "an invalid record" do
    it { is_expected.not_to be_valid }
  end

  it { is_expected.to be_valid }

  context "when the name property is blank" do
    subject { build(:document1, name: '', user: user) }

    it_behaves_like "an invalid record"
  end

  context "when the name property has less than 6 characters" do
    subject { build(:document1, name: 'less', user: user) }

    it_behaves_like "an invalid record"
  end

  context "when there is no owner" do
    subject { build(:document1, user: nil) }

    it_behaves_like "an invalid record"
  end

  context "when the description property exceeds 100 characters" do
    let(:description) { (0...101).map { ("a".."z").to_a[rand(26)] }.join }
    subject { build(:document1, user: user, description: description) }

    it_behaves_like "an invalid record"
  end
end
