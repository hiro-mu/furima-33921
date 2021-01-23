class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :municipalities
    validates :house_number
    validates :telephone_number, numericality: { less_than_or_equal_to: 11, message: "Input only number" }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "Select" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end