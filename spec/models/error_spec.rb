require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end
  describe '商品の出品登録' do
    context '商品の出品ができないとき' do
      it 'カテゴリーがother_than: 1 だった場合出品できない' do
        @item.category_id = 1
        @item.valid?
        binding.pry
      end
    end
  end
end
