require 'rails_helper'

describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品' do
    context '商品出品ができる' do
      it '商品画像・商品名・商品の説明・カテゴリー・商品の状態・配送料の負担・発送元の地域・発送までの日数・価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が空では出品できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it '配送料の負担が空では出品できない' do
        @item.shipping_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee is not a number")
      end
      it '発送限の地域が空では出品できない' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it '発送までの日数が空では出品できない' do
        @item.days_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end
      it '価格が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字では出品できない' do
        @item.price = "５５５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が300円未満では出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end