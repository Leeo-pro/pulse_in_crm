FactoryBot.define do
  factory :inquiry_input_content do
    content { 'MyText' }
    inquiry { nil }
  end
end
