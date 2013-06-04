# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu_item do
    name "MyString"
    description "MyText"
    price_in_cents 1
  end
end
