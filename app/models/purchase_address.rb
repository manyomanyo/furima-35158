class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_number, :city, :block, :building, :phone_number, :user_area_id, :product_id, :user_id, :token

  with_options presence: true do
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :block
    validates :phone_number,  format: {with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :product_id
  end
  validates :user_area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(product_id: product_id, user_id: user_id)
    Address.create(postal_number: postal_number, user_area_id: user_area_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end