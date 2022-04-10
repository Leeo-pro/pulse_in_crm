FactoryBot.define do
  factory :inquiry_reply do
<<<<<<< HEAD
    title { 'MyString' }
    content { 'MyText' }
=======
    sequence(:title) { |n| "TITLE#{n}" }
    sequence(:content) { |n| "CONTENT#{n}" }
>>>>>>> upstream/main
  end
end
