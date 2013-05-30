FactoryGirl.define do
  sequence :spotter do |n|
    "John Smith#{n}"
  end
  factory :spotting do
    bird_name 'robin'
    spotted_by { generate(:spotter) }
    location "Boston"

    trait :local do
      location 'Boston'
    end

    trait :away do
      location 'Long Island'
      spotted_by 'John Jones'
    end
  end
end
