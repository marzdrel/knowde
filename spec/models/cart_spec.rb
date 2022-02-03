require "rails_helper"

RSpec.describe Cart, type: :model do
  describe "#to_param" do
    let(:model) { described_class.new(marker: "057053dc2b7d") }

    it "uses marker for param" do
      expect(model.to_param).to eq "057053dc2b7d"
    end
  end
end
