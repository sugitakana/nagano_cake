class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_addresses.all
  end
  
  def create
    @address = Address.new(address_params)
    if @address.save
       flash[:notice] = "登録しました"
       redirect_to addresses_path
    else
      @address = Address.new
      render 'index'
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to  addresses_path
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
