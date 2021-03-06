class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birth_day
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/,message:'全角で入力してください' } do
      validates :first_name
      validates :family_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/,message:'全角カナで入力してください' } do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
  validates :password, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/,message: 'は半角英数字を含めてください'}
  has_many :items
  has_many :purchases
end
