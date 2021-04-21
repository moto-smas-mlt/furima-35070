require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報保存' do

    context '商品の情報保存がうまくいくとき' do
      it '全ての値が問題無く保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品の情報保存がうまくいかないとき' do

      it '出品画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空では保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では保存できないこと' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it '配送料の負担が空では保存できないこと' do
        @item.delivery_charge_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
      end

      it '発送元の地域が空では保存できないこと' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end

      it '発送までの日数が空では保存できないこと' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it '価格が空では保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300未満だと保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it '価格が¥10,000,000以上だと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it '価格が全角数字だと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it 'userが紐付いてないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end