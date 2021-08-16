require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it "priceとtokenがあれば購入できる" do
        expect(@order_address).to be_valid
      end
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
      it '都道府県の項目が1だと購入できない' do
        @order_address.prefecture = within(range: 1)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
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
      it '電話番号が12桁では購入できない' do
        @order_address.phone = "000000000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が英数字混合では購入できない' do
        @order_address.phone = "a0b1c2d3e4"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'user_idが空だと購入できない' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end