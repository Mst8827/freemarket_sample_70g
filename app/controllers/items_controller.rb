class ItemsController < ApplicationController
  def index
  end

  # def new
  #   @item = Item.new
  #   @item.images.new
  # end
  def new
    @item = Item.new
    @item.images.new
  end



  def create
    @pitem = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :condition, :shipping_fee_payer, :shipping_location, :shipping_days, :price, images_attributes: [:image], categories_attributes: [:ancestry], brands_attributes: [])
  end

end
