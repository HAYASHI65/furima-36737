require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context 'ユーザー登録ができる時' do
      it '必須項目が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailに@が含まれていない場合は登録できない' do
        @user.email = 'hayashi.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordに数字が含まれていない場合は登録できない' do
        @user.password = 'hayashi'
        @user.password_confirmation = 'hayashi'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'hayashi６５'
        @user.password_confirmation = 'hayashi６５'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'haya'
        @user.password_confirmation = 'haya'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上の半角英数字で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'hayashi65'
        @user.password_confirmation = 'hayashi66'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameに漢字・ひらがな・カタカナ以外が含まれている場合は登録できない' do
        @user.last_name = 'HAYASHI'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力してください")
      end
      it 'first_nameに漢字・ひらがな・カタカナ以外が含まれている場合は登録できない' do
        @user.first_name = 'HAYASHI'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は全角で入力してください")
      end
      it 'last_name_kanaにカタカナ以外が含まれている場合は登録できない' do
        @user.last_name_kana = '林'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナは全角カタカナで入力してください")
      end
      it 'first_name_kanaにカタカナ以外が含まれている場合は登録できない' do
        @user.first_name_kana = '林'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナは全角カタカナで入力してください")
      end
    end
  end
end
