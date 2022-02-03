require "rails_helper"

RSpec.describe BarcodesController::IndexAction do
  let(:service) { described_class.new(params, request) }
  let(:request) { instance_double(ActionDispatch::Request) }
  let(:params) { ActionController::Parameters.new }

  describe "#call" do
    it "returns new cart object" do
      expect(service.call).to be_nil
    end
  end
end
