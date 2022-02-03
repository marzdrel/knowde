require "rails_helper"

RSpec.describe CartsController::UpdateAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:params) { ActionController::Parameters.new(id: "2c080760e9") }
  let(:cart) { instance_double(Cart) }

  before do
    allow(Cart).to receive_messages(find_by!: cart)
  end

  describe "#cart" do
    it "returns cart object" do
      expect(service.cart).to be cart
    end

    it "loads the object using marker" do
      service.cart

      expect(Cart)
        .to have_received(:find_by!)
        .with(marker: "2c080760e9")
    end
  end

  describe "#valid?" do
    pending
  end
end
