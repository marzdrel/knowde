class BasePresenter < SimpleDelegator
  def self.wrap(collection = nil)
    (collection || yield).map do |obj|
      new obj
    end
  end

  def method_missing(name, *args)
    if name.to_s == __getobj__.class.name.underscore
      __getobj__
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s == __getobj__.class.name.underscore || super
  end

  private

  def object
    __getobj__
  end

  def helper
    @_helper ||= ActionController::Base.helpers
  end

  def route
    @_route ||= Rails.application.routes.url_helpers
  end
end
