class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_fee_type
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :information
    validates :price
  end

  with_options numericality: { other_than: 1, message: "Select" } do
    validates :category_id
    validates :condition_id
    validates :days_to_ship_id
    validates :prefecture_id
    validates :shipping_fee_type_id
  end

  validates :price, numericality: { only_integer: true, message: "Half-width number" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
end
