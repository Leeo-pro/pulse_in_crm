class InquiryInputContent < ApplicationRecord
  belongs_to :inquiry, optional: true
  belongs_to :inquiry_form_item
end
