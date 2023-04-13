class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    
  end
  
  def destroy
  end
  
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
