require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
      it '郵便番号が「３桁ハイフン４桁」の半角文字列であれば購入できること' do
        @order_address.postal_code = "123-4567"
        expect(@order_address).to be_valid
      end
      it '電話番号が10桁以上の半角数値のみであれば購入できること' do
        @order_address.phone = '0000000000'
        expect(@order_address).to be_valid
      end
      it '電話番号が11桁以内の半角数値のみであれば購入できること' do
        @order_address.phone = '00000000000'
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '郵便番号が空では購入できないこと' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角文字列だけでは購入できないこと' do
        @order_address.postal_code = "0000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空では購入できないこと' do
        @order_address.prefecture = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できないこと' do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では購入できないこと' do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できないこと' do
        @order_address.phone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が全角数字では購入できない' do
        @order_address.phone = "００００００００００"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end