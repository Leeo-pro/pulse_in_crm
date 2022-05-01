class InquiryFormRadioBoxContent < ApplicationRecord
  before_create :set_uuid
  belongs_to :inquiry_form_content
  belongs_to :inquiry_form_radio_box
end
