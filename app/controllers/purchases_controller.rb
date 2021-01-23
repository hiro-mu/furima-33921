class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      binding.pry
      @purchase_address.save
      redirect_to item_path(@item)
    else
      render action: :index
    end
  end

  private
  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number, :purchase_id).merge(user_id: current_user.id, item_id: @item.id)
  end
end