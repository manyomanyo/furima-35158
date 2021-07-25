class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :item_state
  belongs_to :user_area

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_state_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :user_area_id
  end

  with_options presence: true do
    validates :name, length:{maximum: 40}
    validates :description, length:{maximum: 1000}
    validates :price, numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
end
