class BarcodesController::UpdateAction
  def self.call(...)
    new(...).call
  end

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def call
  end

  def valid?
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  private

  attr_accessor :params, :user, :request
end
