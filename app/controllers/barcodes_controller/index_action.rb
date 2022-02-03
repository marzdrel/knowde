class BarcodesController::IndexAction
  def self.call(...)
    new(...).call
  end

  def initialize(params, request)
    self.params = params
    self.request = request
  end

  def call
  end

  private

  attr_accessor :params, :user, :request
end
