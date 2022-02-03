class CartsController::UpdateAction
  extend Adornable

  def self.call(...)
    new(...).tap(&:call)
  end

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def call
    return unless valid?

    cart.products << product
  end

  def valid?
    product.present?
  end

  def message_klass
    "btn-outline-danger"
  end

  def message
    "Product not Found"
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  private

  attr_accessor :params, :user, :request

  decorate :memoize
  def product
    Product.find_by(code: data.fetch(:code))
  end

  def data
    params
      .require(:cart)
      .permit(:code)
  end
end
