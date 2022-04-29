class InquiryFormItem < ApplicationRecord
  belongs_to :inquiry_form
  has_many :inquiry_item_selects, dependent: :destroy
  has_many :inquiry_input_contents, dependent: :destroy

  accepts_nested_attributes_for :inquiry_item_selects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :inquiry_input_contents, allow_destroy: true

  enum type: { short_text: 0, long_text: 1, selection: 2, radio: 3 }
end
