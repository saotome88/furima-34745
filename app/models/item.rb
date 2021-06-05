class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :descriptionm, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price
  end
  
  has_one_attached :image
  belongs_to :user
#  has_one :purchase
end