class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItems.all
  end
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if CartItems.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItems.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif @cart_item.save
      @cart_items = CartItems.all
      redirect_to cart_items_path
    else
      render "customers/items/show"
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end
  
  private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :price, :amount)
    end
end
