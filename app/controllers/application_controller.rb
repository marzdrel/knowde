class ApplicationController < ActionController::Base
  def hello
  end

  def action_args
    [
      params,
      request,
    ]
  end
end
