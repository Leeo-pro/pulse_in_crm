class InquiryFormItem < ApplicationRecord
  belongs_to :inquiry_form
  has_many :inquiry_item_selects, dependent: :destroy
  has_many :inquiry_input_contents, dependent: :destroy

  enum type: { short_text: 0, long_text: 1, selection: 2, radio: 3 }
end
