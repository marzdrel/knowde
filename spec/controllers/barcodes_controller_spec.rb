require "rails_helper"

RSpec.describe BarcodesController, type: :controller do
  describe "GET #index" do
    let(:klass) { described_class::IndexAction }
    let(:cart) { OpenStruct.new(cart: :cart) }

    before do
      allow(klass).to receive_messages(call: cart)
    end

    it "redirects to cart" do
      get :index

      expect(response).to have_http_status(:redirect)
    end
  end
end
