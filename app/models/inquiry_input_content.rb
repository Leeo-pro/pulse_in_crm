class InquiryInputContent < ApplicationRecord
  belongs_to :inquiry
  belongs_to :inquiry_form_item
end
