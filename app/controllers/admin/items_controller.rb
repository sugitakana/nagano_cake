class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item= Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_item_path(@item)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
   private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
    end
end
 