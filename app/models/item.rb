class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # ActiveHashで保存されたデータ項目
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  # ActiveHashでid:0の"---"で保存されないように設定
  with_options numericality:  { other_than: 0 } do
    validates :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_day_id
  end

  # 空の値は保存されないようにする。
  with_options presence: true do
  validates :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :image
  end
  validates :price, presence: true, format: {with: /\A[0-9]+\z/}, numericality: {only_integer: true, greater_than: 299, less_than: 10000000}

  belongs_to :user
  has_one_attached :image
# has_one :purchase

end