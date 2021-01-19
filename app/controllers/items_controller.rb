class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :condition_id, :shipping_fee_type_id, :prefecture_id, :days_to_ship_id, :price)
  end
end
