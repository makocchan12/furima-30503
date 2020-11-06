require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end
  describe '購入情報の保存' do
    context '情報の保存ができないとき' do
      it '電話番号はハイフン不要で11桁以内であること' do
        
      end
    end
  end
end
