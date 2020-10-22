class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :first_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_day,        presence: true
  validates :password,         format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ }
end
