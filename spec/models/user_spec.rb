require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    it '必須項目が全て存在すれば登録できる' do
      
    end
    it 'nicknameが空では登録できない' do
      
    end
    it 'emailが空では登録できない' do
      
    end
    it 'passwordが空では登録できない' do
      
    end
    it 'last_nameが空では登録できない' do
      
    end
    it 'first_nameが空では登録できない' do
      
    end
    it 'last_name_kanaが空では登録できない' do
      
    end
    it 'first_name_kanaが空では登録できない' do
      
    end
    it 'birthdayが空では登録できない' do
      
    end
    it '重複したemailが存在する場合は登録できない' do
      
    end
    it 'emailに@が含まれていない場合は登録できない' do
      
    end
    it 'passwordに数字が含まれていない場合は登録できない' do
      
    end
    it 'passwordが5文字以下では登録できない' do
      
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      
    end
    it 'last_nameに漢字・ひらがな・カタカナ以外が含まれている場合は登録できない' do
      
    end
    it 'first_nameに漢字・ひらがな・カタカナ以外が含まれている場合は登録できない' do
      
    end
    it 'last_name_kanaにカタカナ以外が含まれている場合は登録できない' do
      
    end
    it 'first_name_kanaにカタカナ以外が含まれている場合は登録できない' do
      
    end
  end
end
