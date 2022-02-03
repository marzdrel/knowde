class ApplicationController < ActionController::Base
  def action_args
    [
      params,
      request,
    ]
  end
end
