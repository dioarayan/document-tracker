require "rails_helper"

describe Category do
    let(:category) { cache(:category1)}

    shared_examples "an invalid input" do
        it { is_expected.not_to be_valid }
    end

    context "when the name property is blank" do
        subject { build(:category1, name: '') }

        it_behaves_like "an invalid input"
    end

    context "when category name is already exist" do 
        subject { build(:category1, name: category.name) }

        it_behaves_like "an invalid input"
    end
end