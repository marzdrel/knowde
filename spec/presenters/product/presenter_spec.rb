require "rails_helper"

RSpec.describe Product::Presenter do
  let(:service) { described_class.new(object) }

  let(:object) do
    instance_double(Product, price: 123.23)
  end

  describe "#pretty_cash" do
    it "formats the currecy" do
      expect(service.pretty_cash(:price)).to eq "$123.23"
    end
  end

  describe "#pretty_price" do
    it "formats the currecy" do
      expect(service.pretty_price).to eq "$123.23"
    end
  end

  describe "#pretty_total" do
    # FIXME: 2022-02-03 - Either create factories or just use non-verified
    # double (double(...) because dynamic methods created in SQL query cant
    # be verified.

    before do
      create(:product)
    end

    let(:object) do
      object_double(Product.summary.first, price: 123.23, total: 200)
    end

    it "formats the currecy" do
      expect(service.pretty_total).to eq "$200.00"
    end
  end
end
