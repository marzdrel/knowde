require "rails_helper"

RSpec.describe BasePresenter do
  describe ".wrap" do
    let(:collection) { [1, 2, 3] }
    let(:decorated_collection) { described_class.wrap(collection) }

    it "returns wrapped collection" do
      expect(decorated_collection).to eq [1, 2, 3]
    end
  end

  describe "object accessor" do
    context "with array object" do
      let(:data) { [1, 2] }

      it "allows access by object class name" do
        decorator = described_class.new(data)
        expect(decorator.array).to equal data
      end
    end

    context "with Pathname object" do
      let(:data) { Pathname.new "test" }

      it "allows access by object class name" do
        decorator = described_class.new(data)
        expect(decorator.pathname).to equal data
      end
    end
  end
end
