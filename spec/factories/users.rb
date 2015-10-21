FactoryGirl.define do
  factory :user do
    # we use a sequence to make sure every User that is created has a unique email.
    sequence(:email) {|n| "email#{n}@example.com" }
    password "password123"

  end
end
