FactoryGirl.define do

  factory :user do
    email "brett.shollenberger@gmail.com"
    password "foobar29"
    password_confirmation "foobar29"
    admin "true"
  end

  factory :inquiry do
    user
    subject "You're so great"
    description "Derghub is my favorite!"
  end
end


