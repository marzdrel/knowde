require "rails_helper"

RSpec.describe CartsController::UpdateAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:cart) { instance_double(Cart) }
  let(:inserter) { instance_double(Cart::Inserter) }

  let(:params) do
    ActionController::Parameters.new(
      id: "2c080760e9",
      cart: { code: "123" },
    )
  end

  before do
    allow(Cart).to receive_messages(find_by!: cart)
    allow(Cart::Inserter).to receive_messages(call: inserter)
  end

  describe "delegations" do
    subject { service }

    it { should delegate_method(:message).to(:product) }
    it { should delegate_method(:message_klass).to(:product) }
    it { should delegate_method(:valid?).to(:result) }
  end

  describe "#message" do
    context "with no product" do
      before do
        allow(inserter).to receive_messages(product: nil)
      end

      it "returns default error message" do
        expect(service.message).to eq "Product not found"
      end
    end
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

  describe "#call" do
    it "passes the data to scanner" do
      service.call

      expect(Cart::Inserter)
        .to have_received(:call)
        .with(cart, "123")
    end
  end
end
