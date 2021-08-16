class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture, numericality: { other_than: 1}
    validates :municipality
    validates :address
    validates :phone, format: {with: /\A0[0-9]{9,10}\z/ }
    validates :user_id  
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, phone: phone, order_id: order.id)
  end
end