class PurchasesController < ApplicationController
  def index
    # indexファイルで商品情報を表示するためにインスタンス変数を生成する
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_buyer = PurchaseBuyer.new(params[:item_id])
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      binding.pry
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_buyer).permit( :shipping_postal_code, :shipping_address_municipality,
      :prefecture_id, :shipping_address_number, :shipping_address_building, :shipping_phone_number ).
      merge(user_id: current_user.id, item_id: params[:item_id])
  end
end