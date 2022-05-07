FactoryBot.define do
  factory :access_authorization do
    inquiry_browse { true }
    inquiry_reply { true }
    inquiry_form_setting { true }
    user
  end
end
