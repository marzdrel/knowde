class CartsController::EditAction
  extend Adornable

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  delegate :message_klass, :message, to: :product

  private

  attr_accessor :params, :request

  decorate :memoize
  def product
    cart.ordered_products_last.then do |value|
      if value
        Product::Presenter.new(cart.ordered_products_last)
      else
        Product::Empty.new
      end
    end
  end
end
