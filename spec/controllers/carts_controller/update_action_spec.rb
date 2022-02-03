require "rails_helper"

RSpec.describe CartsController::UpdateAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:cart) { instance_double(Cart, products: products) }
  let(:products) { [] }
  let(:product) { nil }

  let(:params) do
    ActionController::Parameters.new(
      id: "2c080760e9",
      cart: { code: "123" },
    )
  end

  before do
    allow(Cart).to receive_messages(find_by!: cart)
    allow(Product).to receive_messages(find_by: product)
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
    context "with valid product" do
      let(:product) { :product }

      it "adds product to cart" do
        service.call

        expect(products).to eq [:product]
      end
    end
  end

  describe "#valid?" do
    context "with valid product" do
      let(:product) { :product }

      it "is valid" do
        expect(service).to be_valid
      end
    end

    context "without valid product" do
      let(:product) { nil }

      it "is not valid" do
        expect(service).not_to be_valid
      end
    end
  end
end
