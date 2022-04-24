class InquiryFormItem < ApplicationRecord
  belongs_to :inquiry_form
  has_many :inquiry_item_selects, dependent: :destroy
  has_many :inquiry_input_contents, dependent: :destroy
end
