class PurchasesController < ApplicationController
  before_action :move_to_items_index, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to item_path(@item)
    else
      render action: :index
    end
  end

  private

  def move_to_items_index
    @item = Item.find(params[:item_id])
    if (user_signed_in? && current_user.id == @item.user_id) || Purchase.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number, :purchase_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: address_params[:price],
    card: address_params[:token],
    currency: 'jpy'
  )
  end

end
