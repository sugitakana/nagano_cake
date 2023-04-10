class Public::HomesController < ApplicationController
  
  def top
    @genres = genre.all
    @items = item.all
  end
  
  def about
  end
end
