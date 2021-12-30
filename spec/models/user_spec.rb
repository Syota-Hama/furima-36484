require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が指示に沿って入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '登録済みのemailでは登録できない' do
        @user.save
        user = FactoryBot.build(:user)
        user.email = @user.email
        user.valid?
        expect(user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが６文字以上でないと登録できない' do
        @user.password = '12aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password is invalid. Include both letters and numbers')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password is invalid. Include both letters and numbers")
      end
      it 'passwordとpassword_confirmationが同じでないと登録できない' do
        @user.password = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名前（全角）は、苗字がないと登録ができない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Last name is invalid. Input full-width characters')
      end
      it '名前（全角）は、名前がないと登録ができない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name First name is invalid. Input full-width characters')
      end
      it '苗字（全角）は、（漢字、ひらがな、カタカナ）での入力でないと登録できない' do
        @user.family_name = 'family'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Last name is invalid. Input full-width characters')
      end
      it '名前（全角）は、（漢字、ひらがな、カタカナ）での入力でないと登録できない' do
        @user.first_name = 'first'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name First name is invalid. Input full-width characters')
      end
      it '名前（カナ）は、苗字がないと登録できない' do
        @user.family_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name hurigana can't be blank")
      end
      it '名前（カナ）は、名前がないと登録できない' do
        @user.first_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name hurigana can't be blank")
      end
      it '苗字（カナ）は、カタカナでの入力でないと登録できない' do
        @user.family_name_hurigana = '漢字ひらfamily'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name hurigana Last name kana is invalid. Input full-width katakana characters')
      end
      it '名前（カナ）は、カタカナでの入力でないと登録できない' do
        @user.first_name_hurigana = '漢字ひらfirst'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name hurigana First name kana is invalid. Input full-width katakana characters')
      end
      it '生年月日がないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
