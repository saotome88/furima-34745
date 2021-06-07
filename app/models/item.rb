class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # ActiveHashで保存されたデータ項目
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge

  # ActiveHashでid:1の"---"で保存されないように設定
  with_options numericality:  { other_than: 1 }
    validates :category_id, :condition_id, :delivery_charge_id
  end

  # 空の値は保存されないようにする。
  with_options presence: true do
  validates :name, :descriptionm, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :image
  end
  validates :price, presence: true, format: {with: /\A[0-9]+\z/}, numericality: {only_integer: true, greather_than: 300, less_than: 9999999}

  belongs_to :user
  has_one_attached :image
# has_one :purchase
end