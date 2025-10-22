class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  private

  def current_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end
end
