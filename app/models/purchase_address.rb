class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :purchase_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/,message: 'は半角数字で入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/,message: 'は半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1,message: 'を選択してください' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
