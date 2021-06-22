require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    # user_idとitem_idの紐付けを設定する
    @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品の購入' do
    context '正しく購入ができる場合' do
      it 'ログイン状態でクレジットカード情報と配送先が入力されていれば購入ができる' do
        expect(@purchase_buyer).to be_valid
      end
      it '配送先の建物名が空でも購入ができる' do
        @purchase_buyer.shipping_address_building = ''
        expect(@purchase_buyer).to be_valid
      end
      it '配送先の電話番号は10桁でも購入ができる' do
        @purchase_buyer.shipping_phone_number = '1234567890'
        expect(@purchase_buyer).to be_valid
      end
    end

    context '購入ができない場合' do
      it 'クレジットカード情報が入力されていないと購入できない' do
        @purchase_buyer.token = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
      it '配送先で郵便番号が空だと購入ができない' do
        @purchase_buyer.shipping_postal_code = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('郵便番号を入力してください', '郵便番号は不正な値です')
      end
      it '配送先で郵便番号が全角入力だと購入ができない' do
        @purchase_buyer.shipping_postal_code = '１２３ー１２３４'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '配送先で郵便番号でハイフンがないと購入ができない' do
        @purchase_buyer.shipping_postal_code = '1231234'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '配送先でハイフンの前が3桁でないと購入ができない' do
        @purchase_buyer.shipping_postal_code = '1234-1234'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '配送先で郵便番号でハイフンの後が4桁でないと購入ができない' do
        @purchase_buyer.shipping_postal_code = '123-12345'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it '配送先で都道府県が選択されていないと購入ができない' do
        @purchase_buyer.prefecture_id = 0
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('都道府県は0以外の値にしてください')
      end
      it '配送先で市区町村が空だと購入ができない' do
        @purchase_buyer.shipping_address_municipality = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('市区町村を入力してください')
      end
      it '配送先で番地が空だと購入ができない' do
        @purchase_buyer.shipping_address_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('番地を入力してください')
      end
      it '配送先で電話番号が空だと購入ができない' do
        @purchase_buyer.shipping_phone_number = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('電話番号を入力してください', '電話番号は不正な値です')
      end
      it '配送先で電話番号に全角入力だと購入ができない' do
        @purchase_buyer.shipping_phone_number = '１２３１２３４１２３４'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '配送先で電話番号に半角数字以外の入力があると購入ができない' do
        @purchase_buyer.shipping_phone_number = '123-123-123'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '配送先で電話番号に11桁より多い入力だと購入ができない' do
        @purchase_buyer.shipping_phone_number = '123456789012'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '配送先で電話番号に10桁より少ない入力だと購入ができない' do
        @purchase_buyer.shipping_phone_number = '123456789'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '購入商品のitem_idが紐づいていないと購入できないこと' do
        @purchase_buyer.item_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('Itemを入力してください')
      end
      it '購入者のuser_idが紐づいていないと購入できないこと' do
        @purchase_buyer.user_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end

# bundle exec rspec spec/models/purchase_buyer_spec.rb
