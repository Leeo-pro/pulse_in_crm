FactoryBot.define do
  factory :access_authorization do
    inquiry_browse {true}
    inqury_reply {true}
    inqury_form_setting {true}
    user
  end
end
