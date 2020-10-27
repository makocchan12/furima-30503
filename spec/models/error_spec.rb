require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end
  describe '商品の出品登録' do
    context '商品の出品ができないとき' do
      it '価格は半角数字のみ保存可能' do
        @item.price = '５００'
        @item.valid?
      end
    end
  end
end
