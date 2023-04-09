class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
  end
  
  private
    def order_params
      params.require(:order).permit(:status)
    end
end
