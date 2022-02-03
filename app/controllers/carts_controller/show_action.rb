class CartsController::ShowAction
  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  private

  attr_accessor :params, :request
end
