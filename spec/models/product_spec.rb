require "rails_helper"

RSpec.describe Product, type: :model do
  describe "relations" do
    it { should have_many(:line_items) }
    it { should have_many(:carts).through(:line_items) }
  end
end
