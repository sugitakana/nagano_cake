class Admin::OrderDetailsController < ApplicationController
  
  
  private
    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end
end