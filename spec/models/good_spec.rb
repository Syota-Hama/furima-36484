require 'rails_helper'

RSpec.describe Good, type: :model do
  before do
    @goods = FactoryBot.build(:good)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'すべての項目が指示通りに入力されていれば出品できる' do
        expect(@goods).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像が添付されていなければ出品できない' do
        @goods.item_image = nil
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Item image can't be blank")
      end
      it '商品名が入力されていなければ出品できない' do
        @goods.items_name = ''
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Items name can't be blank")
      end
      it '商品名が４０文字以内でなければ出品できない' do
        @goods.items_name = '12345678901234567890123456789012345678901４０文字以上'
        @goods.valid?
        expect(@goods.errors.full_messages).to include('Items name is too long (maximum is 40 characters)')
      end
      it '商品説明が入力されていなければ出品できない' do
        @goods.items_explanation = ''
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Items explanation can't be blank")
      end
      it '商品説明が１０００文字以内でなければ出品できない' do
        @goods.items_explanation = '8777138097953947462533639949097675964304120033588164677427669229450159500409876649608050804510602271870906955063150721290968347294448631022166732458238154949885916116024283419588085749692209789508351300632768907056556379149620595329722817777609492303099101476010810137427177766943755041531373803418538081452186123444347958674140411271764807914467011670514313105109124150487079895614044136191311322940281019323210772790157595751498293515984687964419982245293333341475090136591405337697504568686474110388810251116299125990550859090906370142049369152760117569023275910592526710234668544904321150521973342230977889686196866831751281392028358569556661240982166537617273667845695101216239838137292780296860270888406805565347463687135816862686990059488410574601261988225917711339951487879137428908773029221536048215423505527749281008279069370454932279323529207680744022068048483103970989193395902551257750699811911978986583332995376494798774874270354358101919301902066703304585560369214163540814853108459451１０００文字以上'
        @goods.valid?
        expect(@goods.errors.full_messages).to include('Items explanation is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーが選択されていなければ出品できない' do
        @goods.category_id = '1'
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が選択されていなければ出品できない' do
        @goods.status_id = '1'
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担が選択されていなければ出品できない' do
        @goods.payment_id = '1'
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Payment can't be blank")
      end
      it '発送元の地域が選択されていなければ出品できない' do
        @goods.prefecture_id = '1'
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が選択されていなければ出品できない' do
        @goods.delivery_id = '1'
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Delivery can't be blank")
      end
      it '販売価格が入力されていなければ出品できない' do
        @goods.price = ''
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が３００円以下では出品できない' do
        @goods.price = '299'
        @goods.valid?
        expect(@goods.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格が９，９９９，９９９円以上では出品できない' do
        @goods.price = '10000000'
        @goods.valid?
        expect(@goods.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格に半角数字以外が含まれている場合は出品できない' do
        @goods.price = '３００'
        @goods.valid?
        expect(@goods.errors.full_messages).to include("Price is not included in the list")
      end
      it 'userが紐づいていない場合出品できない' do
        @goods.user = nil
        @goods.valid?
        expect(@goods.errors.full_messages).to include("User must exist")
      end
    end
  end
end
