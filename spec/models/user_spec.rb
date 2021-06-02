require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_name,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthday,が入力されていれば登録可' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の英数字なら登録できる' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが全角入力なら登録できる' do
        @user.last_name = '鈴木'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_name_kanaとfirst_name_kanaが全角カナ入力なら登録できる' do
        @user.last_name_kana = 'スズキ'
        @user.first_name = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nick_nameが空だと登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください","パスワードは不正な値です","パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordは存在するがpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません","パスワード（確認用）は不正な値です")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名字)を入力してください","お名前(名字)は不正な値です")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名前)を入力してください","お名前(名前)は不正な値です")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名字)を入力してください","お名前カナ(名字)は不正な値です")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名前)を入力してください","お名前カナ(名前)は不正な値です")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
      it 'passwordとpassword_confirmationが違う値だと登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include  "パスワードは6文字以上で入力してください"
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です", "パスワード（確認用）は不正な値です")
      end
      it 'last_nameが半角入力だと登録できない' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(名字)は不正な値です"
      end
      it 'first_nameが半角入力だと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(名前)は不正な値です"
      end
      it 'last_name_kanaが全角ひらがな入力だと登録できない' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名字)は不正な値です"
      end
      it 'last_name_kanaが全角漢字入力だと登録できない' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名字)は不正な値です"
      end
      it 'last_name_kanaが半角カナ入力だと登録できない' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名字)は不正な値です"
      end
      it 'last_name_kanaが半角英語入力だと登録できない' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名字)は不正な値です"
      end
      it 'first_name_kanaが全角ひらがな入力だと登録できない' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名前)は不正な値です"
      end
      it 'first_name_kanaが全角漢字入力だと登録できない' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名前)は不正な値です"
      end
      it 'first_name_kanaが半角カナ入力だと登録できない' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名前)は不正な値です"
      end
      it 'first_name_kanaが半角英語入力だと登録できない' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(名前)は不正な値です"
      end
    end
  end
end