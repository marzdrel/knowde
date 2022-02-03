class CartsController < ApplicationController
  def index
    action = IndexAction.new(*action_args)

    redirect_to cart_path(action.cart)
  end

  def show
    @action = ShowAction.new(*action_args)
  end

  def update
    @action = UpdateAction.call(*action_args)

    if @action.valid?
      redirect_to @action.cart
    else
      render "show"
    end
  end
end
