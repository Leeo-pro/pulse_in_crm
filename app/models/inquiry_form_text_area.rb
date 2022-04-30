class InquiryFormTextArea < ApplicationRecord
  before_create :set_uuid
  has_one :inquiry_form
  has_many :inquiry_form_text_area_contents, dependent: :destroy
end
