class CartsController::IndexAction
  def self.call(...)
    new(...).call
  end

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def call
  end

  def cart
    @_cart ||= Cart.create!(marker: SecureRandom.hex(4))
  end

  private

  attr_accessor :params, :user, :request
end
