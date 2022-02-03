class CartsController::UpdateAction
  extend Adornable

  def self.call(...)
    new(...).tap(&:call)
  end

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def call = result

  decorate :memoize
  def cart = Cart.find_by!(marker: params.fetch(:id))

  delegate :message, :message_klass, to: :product
  delegate :valid?, to: :result

  private

  attr_accessor :params, :user, :request

  decorate :memoize
  def product
    Product::Null.new
  end

  decorate :memoize
  def result = Cart::Inserter.call(cart, code)

  def code = data.fetch(:code)

  def data = params.require(:cart).permit(:code)
end
