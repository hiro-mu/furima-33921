require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字かつ¥300~¥9999999の間であれば保存できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'imageがないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがないと保存できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'informationがないと保存できない' do
        @item.information = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'category_idの情報がないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'condition_idについての情報がないと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it 'shipping_fee_type_idについての情報がないと保存できない' do
        @item.shipping_fee_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee type Select")
      end
      it 'prefecture_idについての情報がないと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'days_to_ship_idについての情報がないと保存できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship Select")
      end
      it 'priceが¥300以下の場合保存できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが¥9999999以上の場合保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが全角数字の場合保存できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが半角英数混合の場合保存できない' do
        @item.price = "1a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが半角英字の場合保存できない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'userが紐づいてないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
