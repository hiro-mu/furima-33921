require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmatonが６文字以上で半角英数字が混合されていれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it 'kanji_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.kanji_name = '田中'
        expect(@user).to be_valid
      end
      it 'kanji_lastnameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.kanji_lastname = '太郎'
        expect(@user).to be_valid
      end
      it 'kana_nameは全角カタカナであれば登録できる' do
        @user.kana_name = 'タナカ'
        expect(@user).to be_valid
      end
      it 'kana_lastnameは全角カタカナであれば登録できる' do
        @user.kana_lastname = 'タロウ'
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
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含まない場合は登録できない' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordは英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在しても、password_confirmaitonが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmaitonの値が違う場合は登録できない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'kanji_nameが空では登録できない' do
        @user.kanji_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji name can't be blank")
      end
      it 'kanji_nameは全角（漢字・ひらがな・カタカナ）以外が含まれる場合は登録できない' do
        @user.kanji_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji name Full-width characters')
      end
      it 'kanji_lastnameが空では登録できない' do
        @user.kanji_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji lastname can't be blank")
      end
      it 'kanji_lastnameは全角（漢字・ひらがな・カタカナ）以外が含まれる場合は登録できない' do
        @user.kanji_lastname = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji lastname Full-width characters')
      end
      it 'kana_nameが空では登録できない' do
        @user.kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name can't be blank")
      end
      it 'kana_nameは全角カタカナ以外が含まれる場合は登録できない' do
        @user.kana_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana name Full-width katakana characters')
      end
      it 'kana_lastnameが空では登録できない' do
        @user.kana_lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana lastname can't be blank")
      end
      it 'kana_lastnameは全角カタカナ以外が含まれる場合は登録できない' do
        @user.kana_lastname = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana lastname Full-width katakana characters')
      end
      it 'Birthdayは選択されていない時は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
