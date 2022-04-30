class InquiryFormText < ApplicationRecord
  before_create :set_uuid
  has_one :inquiry_form
  has_many :inquiry_form_text_contents, dependent: :destroy
end