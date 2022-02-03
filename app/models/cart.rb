class Cart < ApplicationRecord
  has_many :line_items
  has_many :products, through: :line_items

  def to_param
    marker
  end

  delegate :last, :summary, to: :products, prefix: true
end
