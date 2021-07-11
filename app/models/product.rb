class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :item_state
  belongs_to :user_area

  validates :category_id,     numericality: { other_than: 1 }
  validates :item_state_id,   numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  validates :user_area_id,    numericality: { other_than: 1 }

  with_options presence: true do
    validates :name, length:{maximum: 40}
    validates :description, length:{maximum: 1000}
    validates :price, numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
