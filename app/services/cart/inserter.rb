class Cart::Inserter
  def self.call(...)
    new(...).call
  end

  def initialize(cart, code)
    self.cart = cart
    self.code = code
  end

  def call
  end

  attr_accessor :cart, :code
end
