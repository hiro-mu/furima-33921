class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_fee_type

  with_options presence: true do
    validates :name
    validates :information
    validates :price
  end

  with_options numericality:{ other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :days_to_ship_id
    validates :prefecture_id
    validates :shipping_fee_type_id
  end
end
