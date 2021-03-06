class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :buy_item
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }

    with_options numericality: { other_than: 0, message: 'Unselected' } do
      validates :category_id
      validates :item_status_id
      validates :delivery_charge_burden_id
      validates :prefecture_id
      validates :days_to_ship_id
    end

    with_options numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                 message: 'out of setting range' } do
      validates :price
    end
  end
end
