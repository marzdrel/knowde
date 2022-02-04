require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  describe "#action_args" do
    it "returns expected args" do
      expect(controller.action_args)
        .to be_an Array
    end
  end
end
