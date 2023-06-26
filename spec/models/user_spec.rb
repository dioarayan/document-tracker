require "rails_helper"

describe  User do
  
  shared_examples "an invalid input" do
    it { is_expected.not_to be_valid }
  end

  context "when the username is blank" do
    subject { build(:user1, username: '')}

    it_behaves_like "an invalid input"
  end
end