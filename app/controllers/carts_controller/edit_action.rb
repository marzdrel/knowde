class CartsController::EditAction
  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def message_klass
    "btn-outline-warning"
  end

  def message
    return default_message if cart.products.empty?

    format(
      "%<name>s - %<price>s",
      name: product.name,
      price: product.price,
    )
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  private

  attr_accessor :params, :request

  def product
    @_product ||= cart.products.last
  end

  def default_message
    "Scan first product"
  end
end
