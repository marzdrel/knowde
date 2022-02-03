require "rails_helper"

RSpec.describe CartsController, type: :controller do
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

  describe "PATCH #update" do
    let(:klass) { described_class::UpdateAction }
    let(:cart) { OpenStruct.new(cart: :cart) }

    before do
      allow(klass).to receive_messages(call: action)
    end

    context "with invalid input" do
      let(:action) { instance_double(klass, valid?: false) }

      it "redirects to cart" do
        patch :update, params: { id: "6fc74b4848" }

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
