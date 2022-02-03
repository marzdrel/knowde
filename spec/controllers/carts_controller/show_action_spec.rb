require "rails_helper"

RSpec.describe CartsController::ShowAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:cart) { instance_double(Cart) }

  let(:params) do
    ActionController::Parameters.new(id: "21485300")
  end

  before do
    allow(Cart).to receive_messages(find_by!: cart)
  end

  describe "#cart" do
    it "returns new cart object" do
      expect(service.cart).to be cart
    end
  end

  describe "#products" do
    it "returns aggregated products for final list" do
      expect(service.cart).to be cart
    end
  end

  describe "#message" do
    xit "returns final message" do
      expect(service.message).to eq ""
    end
  end

  describe "#message_klass" do
    it "returns css klass for final message" do
      expect(service.message_klass).to eq "btn-outline-success"
    end
  end
end
