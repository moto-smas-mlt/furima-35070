require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 2
  end

  describe '商品の購入情報が保存される' do
 
    context '商品の購入情報の保存がうまくいくとき' do
      it '全ての値が問題無く保存できること' do
        expect(@order).to be_valid
      end

      it '建物名は空でも保存がうまくいく' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品の購入情報の保存がうまくいかないとき' do
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

      it '都道府県が「0」では保存できないこと' do
        @order.prefecture_id = 0
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

      it 'user_idが空では登録できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
