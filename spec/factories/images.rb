FactoryBot.define do
  factory :image do
    user { nil }
    url { FFaker::Image.url }
  end
end
