class BarcodesController < ApplicationController
  def index
    action = IndexAction.new(*action_args)

    redirect_to barcode_path(action.cart)
  end

  def show
  end

  def create
  end
end
