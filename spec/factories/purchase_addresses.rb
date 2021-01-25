FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    house_number { '1-1' }
    building_name { '東京マンション' }
    telephone_number { '12345678910' }
    token { '1a2s3d4f5g6h7j' }
  end
end
