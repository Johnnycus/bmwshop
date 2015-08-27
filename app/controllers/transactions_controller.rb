class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
              amount: current_order.subtotal,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      @cart = current_order.order_items
      @cart.destroy
      session[:order_id] = nil
      redirect_to products_path, notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

    def generate_client_token
      Braintree::ClientToken.generate
    end

    def check_cart!
      if @order_items == 0
        redirect_to products_path, alert: "Please add some items to your cart before processing your transaction!"
      end
    end
end
