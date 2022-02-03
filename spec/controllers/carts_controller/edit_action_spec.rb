require "rails_helper"

RSpec.describe CartsController::EditAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:cart) { instance_double(Cart, ordered_products_last: product) }

  let(:product) do
    instance_double(Product, name: "Something", price: 200)
  end

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

  describe "#message" do
    context "with product" do
      it "returns final message" do
        expect(service.message).to eq "Something - $200.00"
      end
    end

    context "without product" do
      let(:product) { nil }

      it "returns final message" do
        expect(service.message).to eq "Scan your first product"
      end
    end
  end

  describe "#message_klass" do
    context "with product" do
      it "returns css klass for final message" do
        expect(service.message_klass).to eq "btn-outline-warning"
      end
    end

    context "without product" do
      let(:product) { nil }

      it "returns css klass for final message" do
        expect(service.message_klass).to eq "btn-outline-warning"
      end
    end
  end
end
