require 'rails_helper'

RSpec.describe Good, type: :model do
  before do
    @goods = FactoryBot.build(:good)
    @goods.item_image = fixture_file_upload('app/assets/images/flag.png')
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'すべての項目が指示通りに入力されていれば出品できる' do
        binding.pry
      end
    end

    context '商品出品ができないとき' do
      it '商品画像が添付されていなければ出品できない' do
        
      end
      it '商品名が入力されていなければ出品できない' do
        
      end
      it '商品名が４０文字以内でなければ出品できない' do
        
      end
      it '商品説明が入力されていなければ出品できない' do
        
      end
      it '商品説明が１０００文字以内でなければ出品できない' do
        
      end
      it 'カテゴリーが選択されていなければ出品できない' do
        
      end
      it '商品状態が選択されていなければ出品できない' do
        
      end
      it '配送料の負担が選択されていなければ出品できない' do
        
      end
      it '発送元の地域が選択されていなければ出品できない' do
        
      end
      it '発送までの日数が選択されていなければ出品できない' do
        
      end
      it '販売価格が入力されていなければ出品できない' do
        
      end
      it '販売価格が３００〜９，９９９，９９９円以内でなければ出品できない' do
        
      end
    end
  end
end
