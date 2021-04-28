require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入情報が保存される' do
    context '商品の購入情報の保存がうまくいくとき' do
      it '全ての値が問題無く保存できること' do
        expect(@order).to be_valid
      end
    end

    context '商品の購入情報の保存がうまくいくとき' do
      it '郵便番号が空では保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要であること' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空では保存できないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できないこと' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では保存できないこと' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order.tel_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number can't be blank")
      end

      it '電話番号は11桁以内の数字であること' do
        @order.tel_number = 'abcdef123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel number is too long (maximum is 11 characters)')
      end

      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
