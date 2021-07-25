require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名はなくても登録できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_address.postal_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("Postal number can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい軽視でないと保存できないこと' do
        @purchase_address.postal_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("Postal number is invalid")
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_address.user_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("User area must be other than 1")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("Phone number can't be blank")
      end
      it '電話番号が全角数字だと保存できないこと' do
        @purchase_address.phone_number = '０５０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("Phone number is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to  include("Token can't be blank")
      end
    end
  end
end
