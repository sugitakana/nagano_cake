class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
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
    @order.customer_id = current_customer.id
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.quantity = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end
  
  def complete
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order =  Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :amount_billed, :payment_method, :shipping_fee, :status)
  end
end
