FactoryGirl.define do
  factory :product do
    name { Faker::Name.name}
    description { Faker::Lorem.paragraph }

    factory :invalid_product, parent: :product do
      name nil
    end
  end
end
