class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all
    @items = Item.all
  end
  
  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = Cartitem.new
  end
  
  private
  def item_params
    params.require(:item).permit(:genre_id,:name,:introduction,:price, :is_active)
  end
end

