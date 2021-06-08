require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できるとき' do
      it 'image,name,description,category_id,condition_id,delivery_charge_id,prefecture_id,shipping_day_id,priceが入力されていれば出品できる' do
        expect(@item).to be_valid
      end

      it 'category_idが0以外を選択すれば出品できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it 'condition_idが0以外を選択すれば出品できる' do
        @item.condition_id = 1
        expect(@item).to be_valid
      end
      it 'delivery_charge_idが0以外を選択すれば出品できる' do
        @item.delivery_charge_id = 1
        expect(@item).to be_valid
      end
      it 'prefecture_idが0以外を選択すれば出品できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it 'shipping_day_idが0以外を選択すれば出品できる' do
        @item.shipping_day_id = 1
        expect(@item).to be_valid
      end
      it 'priceが300円以上なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9,999,999円以下なら出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'iamgeが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'nameが空だと出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが0を選択すると出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは0以外の値にしてください")
      end
      it 'condition_idが0を選択すると出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は0以外の値にしてください")
      end
      it 'delivery_charge_idが0を選択すると出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は0以外の値にしてください")
      end
      it 'prefecture_idが0を選択すると出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元は0以外の値にしてください")
      end
      it 'shipping_day_idが0を選択すると出品できない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数は0以外の値にしてください")
      end
      it 'priceが空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格を入力してください")
      end
      it 'priceが全角数字の入力だと出品できない' do
        @item.price = "３３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は数値で入力してください")
      end
      it 'priceが数値以外の入力だと出品できない' do
        @item.price = "五百十一"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は数値で入力してください")
      end
      it 'priceが300円より少ない値だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は299より大きい値にしてください")
      end
      it 'priceが9,999,999円より少ない値だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は10000000より小さい値にしてください")
      end
      it 'userが紐付いてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end