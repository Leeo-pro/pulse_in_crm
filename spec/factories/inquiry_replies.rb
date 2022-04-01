FactoryBot.define do
  factory :inquiry_reply do
    sequence(:title) { |n| "TITLE#{n}" }
    sequence(:content) { |n| "CONTENT#{n}" }
  end
end
