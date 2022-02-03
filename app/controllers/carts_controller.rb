class CartsController < ApplicationController
  def index
    action = IndexAction.new(*action_args)

    redirect_to edit_cart_path(action.cart)
  end

  def edit
    @action = EditAction.new(*action_args)
  end

  def show
    @action = ShowAction.new(*action_args)
  end

  def update
    @action = UpdateAction.call(*action_args)

    if @action.valid?
      redirect_to edit_cart_path(@action.cart)
    else
      render "edit"
    end
  end
end
