class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def purchase_params
    params.require(:purchase_buyer).permit( :shipping_postal_code, :shipping_address_municipality,
      :prefecture_id, :shipping_address_number, :shipping_address_building, :shipping_phone_number ).
      merge(user_id: current_user_id, item_id: @item.id)
  end
end