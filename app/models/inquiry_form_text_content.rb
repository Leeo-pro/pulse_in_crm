class InquiryFormTextContent < ApplicationRecord
  before_create :set_uuid
  belongs_to :inquiry_form_content
  belongs_to :inquiry_form_text
end