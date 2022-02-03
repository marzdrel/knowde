require "rails_helper"

RSpec.describe Cart::Inserter do
  describe ".call" do
    let(:klass) { described_class }

    it "forwards the call" do
      expect(klass)
        .to forward_to_instance(:call)
        .with_2_args
    end
  end

  describe "#call" do
    let(:service) { described_class.new(cart, code) }
    let(:cart) { instance_double(Cart) }
    let(:code) { "123" }

    it "description" do
      pending "#{__FILE__}"
    end
  end
end
