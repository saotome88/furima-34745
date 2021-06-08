class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps

      t.references :user,               foreign_key: true
      t.string     :name,               null: false, default: ""
      t.text       :description,        null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :shipping_day_id,    null: false
      t.integer    :price,              null: false
    end
  end
end