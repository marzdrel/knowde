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
    result
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  delegate :message, :message_klass, to: :product
  delegate :valid?, to: :result

  private

  attr_accessor :params, :user, :request

  decorate :memoize
  def product
    Product::Presenter.new(result.product).presence || Product::Null.new
  end

  def result
    @_result ||= Cart::Inserter.call(cart, code)
  end

  def code
    data.fetch(:code)
  end

  def data
    params
      .require(:cart)
      .permit(:code)
  end
end
