require 'rails_helper'

RSpec.describe OrderObject, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_object = FactoryBot.build(:order_object, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it '必須項目が全て存在すれば購入できる' do
        expect(@order_object).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_object.building = ''
        expect(@order_object).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it 'post_codeが空の場合、購入できない' do
        @order_object.post_code = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prfecture_idが空(---)の場合、購入できない' do
        @order_object.prefecture_id = 1
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空の場合、購入できない' do
        @order_object.city = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空の場合、購入できない' do
        @order_object.block = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空の場合、購入できない' do
        @order_object.phone_number = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'tokenが空の場合、購入できない' do
        @order_object.token = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'user_idが空の場合、購入できない' do
        @order_object.user_id = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空の場合、購入できない' do
        @order_object.item_id = ''
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("Itemを入力してください")
      end
      it 'post_codeにハイフンが含まれていない場合、購入できない' do
        @order_object.post_code = '1234567'
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("郵便番号はハイフンを含めた半角文字列で入力してください (例：123-4567)")
      end
      it 'post_codeに半角文字列以外が含まれている場合、購入できない' do
        @order_object.post_code = '１２３-４５６７'
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("郵便番号はハイフンを含めた半角文字列で入力してください (例：123-4567)")
      end
      it 'phone_numberに半角数値以外が含まれている場合、購入できない' do
        @order_object.phone_number = '090-123-456'
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("電話番号10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが10桁未満の場合、購入できない' do
        @order_object.phone_number = '090123456'
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("電話番号10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが11桁より大きい場合場合、購入できない' do
        @order_object.phone_number = '090123456789'
        @order_object.valid?
        expect(@order_object.errors.full_messages).to include("電話番号10桁以上11桁以内の半角数値で入力してください")
      end
    end
  end
end
