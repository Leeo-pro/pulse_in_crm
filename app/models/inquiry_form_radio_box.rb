class InquiryFormRadioBox < ApplicationRecord
  before_create :set_uuid
  belongs_to :inquiry_form
  has_many :inquiry_form_radio_box_contents, dependent: :destroy
  enum content: { select_item1: 1, select_item2: 2, select_item3: 3, select_item4: 4,  select_item4: 5}
end
