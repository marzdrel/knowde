require "rails_helper"

RSpec.describe Product::Null do
  let(:service) { described_class.new }

  describe "#message_klass" do
    it "returns message_klass" do
      expect(service.message_klass).to eq "btn-outline-danger"
    end
  end

  describe "#message" do
    it "returns message" do
      expect(service.message).to eq "Product not found"
    end
  end
end
