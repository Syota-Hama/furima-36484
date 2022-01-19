require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      good = FactoryBot.create(:good)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: good.user.id, good_id: good.id)

    end

    context 'データが保存ができる場合' do
      it '入力内容に問題がない場合は保存ができる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存ができる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context 'データが保存できない場合' do
      it 'post_codeが空では保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンが含まれなければ保存できない' do
        @order_address.post_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空では保存できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitisが空では保存できない' do
        @order_address.municipalitis = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalitis can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが９桁以下では保存できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number Telephone number is invalid')
      end
      it 'telephone_numberが12桁以上では保存できない' do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number Telephone number is invalid')
      end
      it 'telephone_numberに半角数字以外が含まれている場合では保存できない' do
        @order_address.telephone_number = 'aDあ5678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number Telephone number is invalid')
      end
      it 'userが紐づいていないと保存できない' do
        @order_address.user_id = nil
        binding.pry
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'goodが紐づいていないと保存できない' do
        @order_address.good_id = nil
        binding.pry
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Good can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
