require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入者情報の登録' do
    context '購入者情報の登録ができる場合' do
      it '記入欄全てが正しく存在すれば記録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '購入者情報の登録ができない時' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postalが空だと保存できないこと' do
        @order_address.postal = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Postal can't be blank", 'Postal is invalid')
      end
      it 'postalがハイフンがないと保存できないこと' do
        @order_address.postal = '111111'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Postal is invalid')
      end

      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Phone can't be blank", 'Phone is invalid')
      end

      it 'phoneがハイフンがあると保存できないこと' do
        @order_address.phone = '000-0000-0000'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが11桁を超えると保存できないこと' do
        @order_address.phone = '0000000000000'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが11桁未満だと保存できないこと' do
        @order_address.phone = '0'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'numberが空だと保存できないこと' do
        @order_address.number = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal = '２２２２２２２'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Postal is invalid')
      end

      it 'region_idを選択しないと保存できないこと' do
        @order_address.region_id = 0
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Region must be other than 0')
      end

      it 'region_idが空だと保存できないこと' do
        @order_address.region_id = nil
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Region can't be blank", 'Region is not a number')
      end
    end
  end
end
