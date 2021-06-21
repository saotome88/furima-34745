class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :shipping_postal_code, :prefecture_id, :shipping_address_municipality,
  :shipping_address_number, :shipping_address_building, :shipping_phone_number

  with_options presence: true do
    # アソシエーションを設定できないのでuser_idとitem_idもバリデーションに加える
    validates :user_id, :item_id, :shipping_address_municipality,
              :shipping_address_number
    # 郵便番号はハイフン込みの半角数字で123-1234の桁数に指定する
    validates :shipping_postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    # 電話番号は半角数字のみにする
    validates :shipping_phone_number, format: {with: /\A[0-9]\z/}
  end
  # 都道府県選択はActivehashなので、0以外の選択させる
  validates :prefecture_id, numericality: { other_than: 0 }

  # それぞれのテーブルにデータを保存する
  def save
    # 変数purchaseにuser_idとitem_idを代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 購入者の情報を保存する
    Buyer.create(purchase_id: purchase.id, shipping_postal_code: shipping_postal_code, prefecture_id: prefecture_id,
                 shipping_address_municipality: shipping_address_municipality, shipping_address_number: shipping_address_number,
                 shipping_address_building: shipping_address_building, shipping_phone_number: shipping_phone_number)
  end
end