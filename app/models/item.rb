class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_burden_id
    validates :prefecture_id
    validates :days_to_ship_id
    
    with_options numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999, message: "is invalid"}
      validates :price
  end

end
