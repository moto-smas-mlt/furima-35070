class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :tel_number,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :house_number
    validates :tel_number, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buy_item = BuyItem.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                   house_number: house_number, building_name: building_name, tel_number: tel_number, buy_item_id: buy_item.id)
  end
end
