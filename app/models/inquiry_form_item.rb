class InquiryFormItem < ApplicationRecord
  belongs_to :inquiry_form
  has_many :inquiry_item_selects
  has_many :inquiry_input_contents
end
