class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    item = @cart.cart_items.find_by(product_id: product.id)
    if item
      item.quantity += 1
    else
      item = @cart.cart_items.build(product: product, quantity: 1)
    end
    item.save
    redirect_to cart_path(@cart)
  end

  def destroy
    item = @cart.cart_items.find(params[:id])
    item.destroy
    redirect_to cart_path(@cart)
  end

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] = @cart.id
  end
end
