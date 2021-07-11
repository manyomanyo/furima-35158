require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '内容に問題ない場合' do
      it '商品画像、商品名、商品の説明、商品の詳細、価格を入れると登録できる' do
        expect(@product).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it '商品画像が空であると登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空であると登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空であると登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it '商品詳細のカテゴリーが"---"であると登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品詳細の商品の状態が"---"であると登録できない' do
        @product.item_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Item state must be other than 1")
      end
      it '配送についての配送料の負担が"---"であると登録できない' do
        @product.delivery_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it '配送についての発送元の地域が"---"であると登録できない' do
        @product.user_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("User area must be other than 1")
      end
      it '配送についての発送までの日数が"---"であると登録できない' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it '販売価格が空であると登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '商品名が41文字以上であると登録できない' do
        @product.name = "ひテ1aq"*10 
        @product.valid?
        expect(@product.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品の説明が1001文字以上であると登録できない' do
        @product.description = "ひテ1aq"*201
        @product.valid?
        expect(@product.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it '販売価格が300円未満であると登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10000000円以上であると登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格が全角数字であると登録できない' do
        @product.price = '３４５６'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end

end
