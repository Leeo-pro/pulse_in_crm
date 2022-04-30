class InquiryFormRadioBoxContent < ApplicationRecord
  before_create :set_uuid
  has_one :inquiry_form_content
  has_one :inquiry_form_radio_box
end
