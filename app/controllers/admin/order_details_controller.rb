class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    case @order_detail.production_status
     when "manufacturing"
        @order_detail.order.update(status: "making")
     when "finish"
        if @order_detail.order.order_details.all?{|order_detail| order_detail.production_status == "finish"}
          @order_detail.order.update(status: "preparing_ship")
        end
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end
end
