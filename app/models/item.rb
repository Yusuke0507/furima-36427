class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1} do
    validates :status_id
    validates :area_id
    validates :category_id
    validates :shipping_fee_id
    validates :days_to_ship_id
  end
    with_options presence: true do
      validates :name
      validates :detail
      validates :price, inclusion: {in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
      validates :image
  end
end
