FactoryBot.define do
  factory :purchase_buyer do
    shipping_postal_code          {"123-1234"}
    prefecture_id                 {1}
    shipping_address_municipality {"札幌市"}
    shipping_address_number       {"札幌町1-2-3"}
    shipping_address_building     {"札幌ビル999号"}
    shipping_phone_number         {"11122223333"}
    # カード情報はトークンとしてPayjpに送信される
    token                         {"tok_abcdefghijk00000000000000000"}
  end
end