require "rails_helper"

RSpec.describe BarcodesController::IndexAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:params) { ActionController::Parameters.new }
  let(:cart) { instance_double(Cart) }

  before do
    allow(Cart).to receive_messages(create!: cart)
  end

  describe "#cart" do
    it "returns new cart object" do
      expect(service.cart).to be cart
    end
  end
end
