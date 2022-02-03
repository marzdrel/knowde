class CartsController::ShowAction
  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def message_klass
    "none"
  end

  def message
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  private

  attr_accessor :params, :request
end
