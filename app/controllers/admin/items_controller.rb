class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @items = Item.page(params[:page]).per(10)
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
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       flash[:notice] = "商品情報を更新しました"
       redirect_to admins_item_path(@item)
    else
      render 'edit'
    end
  end
  
   private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
    end
end
 