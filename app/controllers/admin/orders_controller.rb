class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    order.update(order_params)
    if @order.status == "入金確認"
      @order_details.update_all(production_status: "製作待ち")
    end
    redirect_to admin_order_path(@order)
  end
  
  private
    def order_params
      params.require(:order).permit(:status)
    end
end
