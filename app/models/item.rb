class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day_required
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge_payer
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { only_interger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_payer_id
      validates :prefecture_id
      validates :day_required_id
    end
  end
end
