class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :days_to_ship

  has_one_attached :image
end
