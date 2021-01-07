require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '記入欄全てが存在すれば録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '0000aa'
        @user.password_confirmation = '00000a'
        @user.valid?

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_name が空では登録できない' do
        @user.first_name = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end

      it 'first_name は全角（漢字、平仮名、カタカナ、）で入力しないと登録できない' do
        @user.first_name = 'a'
        @user.valid?

        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name が空では登録できない' do
        @user.last_name = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end

      it 'last_name は全角（漢字、平仮名、カタカナ、）で入力しないと登録できない' do
        @user.first_name = 'a'
        @user.valid?

        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'fname_kana が空では登録できない' do
        @user.fname_kana = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Fname kana can't be blank", 'Fname kana is invalid')
      end
      it 'fname_kana は全角（漢字、平仮名、カタカナ、）で入力しないと登録できない' do
        @user.fname_kana = 'aaa'
        @user.valid?

        expect(@user.errors.full_messages).to include('Fname kana is invalid')
      end

      it 'lname_kana が空では登録できない' do
        @user.lname_kana = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Lname kana can't be blank", 'Lname kana is invalid')
      end
      it 'lname_kana は全角（漢字、平仮名、カタカナ、）で入力しないと登録できない' do
        @user.lname_kana = 'aaa'
        @user.valid?

        expect(@user.errors.full_messages).to include('Lname kana is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@がないと登録できない' do
        @user.email = 'test.exmple'

        @user.valid?

        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?

        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?

        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'birthdayが空では保存出来ない' do
        @user.birthday = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
