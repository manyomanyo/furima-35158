require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録/ユーザー情報' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '内容に問題ない場合' do
      it 'ニックネーム、メールアドレス、パスワード、パスワード（確認用）を入れると登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードが半角英数字6文字以上で登録できる（英字、数字両方含める）' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end    
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = '11111q'
        @user.password_confirmation = '22222w'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = '１２３４５ａ'
        @user.password_confirmation = '１２３４５ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
  describe '新規登録/本人情報確認' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '内容に問題がない場合' do
      it '本人の名前の苗字名前、フリガナの苗字名前、生年月日が存在すると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
        @user.user_name_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name family can't be blank")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.user_name_first = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("User name first is invalid")
      end
      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
        @user.user_name_kana_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name kana family can't be blank")
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.user_name_kana_first = 'きんじょう'
        @user.valid?
        expect(@user.errors.full_messages).to include("User name kana first is invalid")
      end
      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '名前が空の場合は登録できない' do
        @user.user_name_family = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name family can't be blank")
      end

      it '苗字が全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.user_name_kana_family = 'meary'
        @user.valid?
        expect(@user.errors.full_messages).to include("User name kana family is invalid")
      end

      it '名前（フリガナ）が空の場合は登録できない' do
        @user.user_name_kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name kana first can't be blank")
      end

      it '苗字（フリガナ）が全角（カタカナ）以外は登録できない' do
        @user.user_name_kana_family = 'きんじょう'
        @user.valid?
        expect(@user.errors.full_messages).to include("User name kana family is invalid")
      end
    end
  end
end
