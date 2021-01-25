require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'postal_codeが数字３桁-４桁の形であれば購入できる' do
        @purchase_address.postal_code = '111-1111'
        expect(@purchase_address).to be_valid
      end

      it 'telephone_numberが11桁以下の数字であれば購入できる' do
        @purchase_address.telephone_number = 11_111_111_111
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できない時' do
      it 'postal_codeについての情報がないと購入できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @purchase_address.postal_code = 1_234_567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが全角数字の場合購入できない' do
        @purchase_address.postal_code = '１２３-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが英字の場合購入できない' do
        @purchase_address.postal_code = 'abc-defg'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが半角英数混合の場合購入できない' do
        @purchase_address.postal_code = '1a2-b3c4'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'municipalitiesについての情報がないと購入できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberについての情報がないと購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberについての情報がないと購入できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが12桁以上である場合購入できない' do
        @purchase_address.telephone_number = 1_234_567_891_011
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end
      it 'telephone_numberが全角数字の場合購入できない' do
        @purchase_address.telephone_number = '１２３４５６７８９１０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number Input only Half-width number')
      end
      it 'telephone_numberが英字の場合購入できない' do
        @purchase_address.telephone_number = 'abcdefghijk'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number Input only Half-width number')
      end
      it 'telephone_numberが半角英数混合の場合購入できない' do
        @purchase_address.telephone_number = '1a2b3c4d5e6'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number Input only Half-width number')
      end
      it 'tokenについての情報がないと購入できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefecture_idについての情報がないと購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
      end

      it 'user_idについての情報がないと購入できない' do
        @purchase_address.user_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idについての情報がないと購入できない' do
        @purchase_address.item_id =""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
