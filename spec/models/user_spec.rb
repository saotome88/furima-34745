require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nick_name,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthday,が入力されていれば登録可' do
      end
      it 'passwordとpassword_confirmationが6文字以上の英数字なら登録できる' do
      end
      it 'last_nameとfirst_nameが全角入力なら登録できる' do
      end
      it 'last_name_kanaとfirst_name_kanaが全角カナ入力なら登録できる' do
      end
    end

    context '新規登録ができないとき' do
      it 'nick_nameが空だと登録できない' do
      end
      it 'emailが空だと登録できない' do
      end
      it 'passwordが空だと登録できない' do
      end
      it 'passwordは存在するがpassword_confirmationが空だと登録できない' do
      end
      it 'last_nameが空だと登録できない' do
      end
      it 'first_nameが空だと登録できない' do
      end
      it 'last_name_kanaが空だと登録できない' do
      end
      it 'first_name_kanaが空だと登録できない' do
      end
      it 'birthdayが空だと登録できない' do
      end
      it 'passwordとpassword_confirmationが違う値だと登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'passwordが5文字以下だと登録できない' do
      end
      it 'passwordが数字のみだと登録できない' do
      end
      it 'last_nameが半角入力だと登録できない' do
      end
      it 'first_nameが半角入力だと登録できない' do
      end
      it 'last_name_kanaが全角ひらがな入力だと登録できない' do
      end
      it 'last_name_kanaが全角漢字入力だと登録できない' do
      end
      it 'last_name_kanaが半角カナ入力だと登録できない' do
      end
      it 'last_name_kanaが半角英語入力だと登録できない' do
      end
      it 'first_name_kanaが全角ひらがな入力だと登録できない' do
      end
      it 'first_name_kanaが全角漢字入力だと登録できない' do
      end
      it 'first_name_kanaが半角カナ入力だと登録できない' do
      end
      it 'first_name_kanaが半角英語入力だと登録できない' do
      end
    end
  end
end