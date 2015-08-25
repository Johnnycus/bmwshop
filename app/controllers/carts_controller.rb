class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def destroy
    @cart = current_order.order_items
    @cart.destroy
    session[:order_id] = nil
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Your cart is empty!' }
      format.json { head :no_content }
    end
  end
end
