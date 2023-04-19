class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_cosutmer.cart_items.all
    @total_price = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_cosutmer.cart_item.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_cosutmer.cart_item.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      flash[:notice] = "カートに商品を入れました"
      redirect_to cart_items_path
    elsif @cart_item.save
      flash[:notice] = "カートに商品を入れました"
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
      render "/items/show"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.amount = params[:cart_item][:id]
    @cart_item.update(cart_item_params)
    flash[:notice] = "個数を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "#{@cart_item.item.name}を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    flash[:alert] = "カート内商品を全て削除"
    redirect_to cart_items_path
  end

  private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
end
