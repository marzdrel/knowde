require "rails_helper"

RSpec.describe CartsController, type: :controller do
  describe "GET #edit" do
    let(:klass) { described_class::EditAction }
    let(:action) { instance_double(klass, cart: :cart) }

    before do
      allow(klass).to receive_messages(new: action)
    end

    it "redirects to cart" do
      get :edit, params: { id: "f66b41be" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #show" do
    let(:klass) { described_class::ShowAction }
    let(:action) { instance_double(klass, cart: :cart) }

    before do
      allow(klass).to receive_messages(new: action)
    end

    it "redirects to cart" do
      get :show, params: { id: "f66b41be" }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #index" do
    let(:klass) { described_class::IndexAction }
    let(:action) { instance_double(klass, cart: :cart) }

    before do
      allow(klass).to receive_messages(call: :cart)
    end

    it "redirects to cart" do
      get :index

      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PATCH #update" do
    let(:klass) { described_class::UpdateAction }
    let(:action) { instance_double(klass, cart: :cart) }

    before do
      allow(klass).to receive_messages(call: action)
    end

    context "with valid input" do
      let(:action) { instance_double(klass, valid?: true, cart: :cart) }

      it "redirects to cart" do
        patch :update, params: {id: "6fc74b4848"}

        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid input" do
      let(:action) { instance_double(klass, valid?: false) }

      it "shows the error page" do
        patch :update, params: {id: "6fc74b4848"}

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
