class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, on: :create, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :user_name_family
      validates :user_name_first
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :user_name_kana_family
      validates :user_name_kana_first
    end
  end

  # has_many :products
  # has_many :purchase
end
