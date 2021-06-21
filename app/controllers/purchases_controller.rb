class PurchasesController < ApplicationController
  def index
    # indexビューで商品情報を表示するためにインスタンス変数を生成する
    @item = Item.find(params[:item_id])
    # エラーメッセージのためにインスタンス変数を生成する
    @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new(purchase_buyer_params)
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_buyer_params
    params.require(:purchase_buyer).permit(:shipping_postal_code, :shipping_address_municipality,:prefecture_id, :shipping_address_number, :shipping_address_building, :shipping_phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    # テスト秘密鍵
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_buyer_params[:token],
      currency: 'jpy'
    )
  end

end