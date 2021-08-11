class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :Shipping_fee
  belongs_to :area
  belongs_to :days_to_ship
  has_one_attached :image

  with_options numericality: { other_than: 1} do
    validates :status_id
    validates :area_id
    validates :category_id
    validates :shipping_fee_id
    validates :days_to_ship_id
  end
    with_options presence: true do
    
  end
end
