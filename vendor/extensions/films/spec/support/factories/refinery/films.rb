
FactoryGirl.define do
  factory :film, :class => Refinery::Films::Film do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

