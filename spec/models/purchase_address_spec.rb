require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @purchase_address.post_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid')
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.post_code = 0o000000
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
    end
    it '都道府県を選択していないと保存できないこと' do
      @purchase_address.prefecture_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end
    it '都道府県のid: 1 がだと保存できないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号はハイフン不要で11桁以内であること' do
      @purchase_address.phone_number = 0o000 - 0o000 - 0o000
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'トークンがないと購入できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
