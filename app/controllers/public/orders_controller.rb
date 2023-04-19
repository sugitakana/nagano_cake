class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render 'new'
    end
    @cart_items = current_customer.cart_items.all
    @total_price = 0
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end
  
  def complete
  end
  
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_fee)
  end
end
