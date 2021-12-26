require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      
    end
    it 'emailが空では登録できない' do
      
    end
    it '登録済みのemailでは登録できない' do
      
    end
    it 'emailに@が含まれていないと登録できない' do
      
    end
    it 'passwordが空では登録できない' do
      
    end
    it 'passwordが６文字以上でないと登録できない' do
      
    end
    it 'passwordが半角英数の混合でないと登録できない' do
      
    end
    it 'passwordとpassword_confirmationが同じでないと登録できない' do
      
    end
    it '名前（全角）は、苗字と名前がないと登録ができない' do
      
    end
    it '名前（全角）は、（漢字、ひらがな、カタカナ）での入力でないと登録できない' do
      
    end
    it '名前（カナ）は、苗字と名前がないと登録できない' do
      
    end
    it '名前（カナ）は、カタカナでの入力でないと登録できない' do
      
    end
    it '生年月日がないと登録できない' do
      
    end
    
  end
end
