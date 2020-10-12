FactoryBot.define do
  factory :image do
    user { nil }
    id_unsplash { FFaker::Color.hex_code }
    url { FFaker::Image.url }
  end
end
