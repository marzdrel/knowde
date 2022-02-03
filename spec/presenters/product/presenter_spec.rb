require "rails_helper"

RSpec.describe Product::Presenter do
  describe "#pretty_cash" do
    it "formats the currecy" do
      expect(service.pretty_cash).to eq :message
    end
  end
end
