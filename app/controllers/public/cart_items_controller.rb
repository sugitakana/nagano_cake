class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_member.cart_items.all
  end
  
  def create
    @cart_item = current_member.cart_items.new(cart_item_params)
    
  end
  
  private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :price, :amount)
    end
end
