require "rails_helper"

RSpec.describe Cart::Inserter do
  describe "#call" do
    let(:service) { described_class.new(cart, code) }
    let(:code) { "123" }
    let(:cart) { instance_double(Cart, products: products) }
    let(:products) { [] }
    let(:product) { nil }

    before do
      allow(Cart).to receive_messages(find_by!: cart)
      allow(Product).to receive_messages(find_by: product)
    end

    describe "#call" do
      context "with valid product" do
        let(:product) { :product }

        it "adds product to cart" do
          service.call

          expect(products).to eq [:product]
        end

        context "without valid product" do
          let(:product) { nil }

          it "does not add products" do
            expect(products).to eq []
          end
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
end
