require "rails_helper"

RSpec.describe Cart, type: :model do
  describe "#to_param" do
    let(:model) { described_class.new(marker: "057053dc2b7d") }

    it "uses marker for param" do
      expect(model.to_param).to eq "057053dc2b7d"
    end
  end

  describe "relations" do
    subject { described_class.new }

    it { should have_many(:products) }
    it { should have_many(:ordered_products) }
  end

  describe "delegations" do
    subject { described_class.new }

    it { should delegate_method(:summary).to(:products).with_prefix }
    it { should delegate_method(:last).to(:ordered_products).with_prefix }
  end
end
