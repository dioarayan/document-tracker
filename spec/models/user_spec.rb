require 'rails_helper'

describe User do
    let(:user) { cache(:user1) }

    shared_examples 'an invalid input' do
        it { is_expected.not_to be_valid }
    end

    context "when the username input is blank" do
        subject { build(:user1, username: '' ) }
        it_behaves_like "an invalid input"
    end

    context "when the username input has less than 3 characters" do
        subject { build(:user1, username: 'no') }
        it_behaves_like "an invalid input"
    end

    context "when the username exceeds 25 characters" do
        let(:username) { (0...26).map { ("a".."z").to_a[rand(26)] }.join }
        subject { build(:user1, username: username) }
        it_behaves_like "an invalid input"
      end

    context "when username is already exist" do 
        subject { build(:user1, username: user.username)}
        it_behaves_like "an invalid input"
    end

    context "when the email input is blank" do
        subject { build(:user1, email: '' ) }
        it_behaves_like "an invalid input"
    end

    context "when email is already exist" do 
        subject { build(:user1, email: user.email)}
        it_behaves_like "an invalid input"
    end

    context "when the email has invalid format" do
        subject {build(:user1, email: '123sasd' )}
        it_behaves_like "an invalid input"
      end

    context "when the email input exceeds 105 characters" do
        let(:email) { (0...106).map { ("a".."z").to_a[rand(106)] }.join }
        subject { build(:user1, email: email) }
        it_behaves_like "an invalid input"
    end
end