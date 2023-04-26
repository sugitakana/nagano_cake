class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.status == "confirm_payment"
      @order_details.update_all(production_status: "waiting_manufacture")
    end
    redirect_to admin_order_path(@order)
  end
  
  private
    def order_params
      params.require(:order).permit(:status)
    end
end
