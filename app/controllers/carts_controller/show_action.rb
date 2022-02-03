class CartsController::ShowAction
  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def message_klass
    "btn-outline-success"
  end

  def message
    format("Total: %<total>s", total:)
  end

  def cart
    @_cart ||= Cart.find_by!(marker: params.fetch(:id))
  end

  def products
    Product::Presenter.wrap do
      cart.products_summary
    end
  end

  private

  attr_accessor :params, :request

  def helper
    @_helper ||= ActionController::Base.helpers
  end

  def total
    helper.number_to_currency(
      cart.products_summary.sum(&:total)
    )
  end
end
