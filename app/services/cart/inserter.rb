class Cart::Inserter
  extend Adornable

  def self.call(...)
    new(...).tap(&:call)
  end

  def initialize(cart, code)
    self.cart = cart
    self.code = code
  end

  def call
    return unless valid?

    cart.products << product
  end

  def valid?
    product.present?
  end

  decorate :memoize
  def product = Product.find_by(code:)

  private

  attr_accessor :cart, :code
end
