class Cart < ApplicationRecord
  has_many :line_items

  has_many :products, through: :line_items

  has_many(
    :ordered_products,
    -> { order("line_items.id") },
    through: :line_items,
    source: :product,
  )

  def to_param
    marker
  end

  delegate :summary, to: :products, prefix: true
  delegate :last, to: :ordered_products, prefix: true
end
