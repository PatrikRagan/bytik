FactoryGirl.define do
  factory :user do
    # name                  "Mark Brown"
    email                 "mbrown@yahoo123.com"
    password              "foobar123"
    password_confirmation "foobar123"
  end
end