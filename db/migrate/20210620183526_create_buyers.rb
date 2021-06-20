class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.timestamps

      t.references :purchase,                       foreign_key: true
      t.string     :shipping_postal_code,           null: false
      t.integer    :prefecture_id,                  null: false
      t.string     :shipping_address_municipality,  null: false
      t.string     :shipping_address_number,        null: false
      t.string     :shipping_address_building
      t.string     :shipping_phone_number,          null: false
    end
  end
end