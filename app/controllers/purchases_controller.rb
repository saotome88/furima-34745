class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find_purchase, only: [:index, :create]
  before_action :move_to_index_purchase, only: [:index, :create]
  before_action :move_to_index_bought, only: [:index, :create]

  def index
    # indexビューで商品情報を表示するためにインスタンス変数を生成する
    # エラーメッセージのためにインスタンス変数を生成する
    @purchase_buyer = PurchaseBuyer.new
  end

  def create
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
    params.require(:purchase_buyer).permit(:shipping_postal_code, :shipping_address_municipality, :prefecture_id, :shipping_address_number, :shipping_address_building, :shipping_phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    # テスト秘密鍵
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_buyer_params[:token],
      currency: 'jpy'
    )
  end

  def item_find_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_index_purchase
    redirect_to root_path if current_user.id == @item.user_id
  end

  def move_to_index_bought
    redirect_to root_path if @item.purchase.present?
  end
end
