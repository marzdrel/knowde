class Product::Presenter < BasePresenter
  def pretty_cash(field)
    value = public_send(field)
    helper.number_to_currency(value)
  end

  def pretty_price
    pretty_cash(:price)
  end

  def pretty_total
    pretty_cash(:total)
  end

  def message_klass
    "btn-outline-warning"
  end

  def message
    format(
      "%<name>s - %<price>s",
      name: name,
      price: helper.number_to_currency(price)
    )
  end
end
