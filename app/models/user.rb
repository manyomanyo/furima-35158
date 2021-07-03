class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :password, on: :create, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    validates :user_name_family,      format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :user_name_first,       format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :user_name_kana_family, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :user_name_kana_first,  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end

  # has_many :products
  # has_many :purchase
end
