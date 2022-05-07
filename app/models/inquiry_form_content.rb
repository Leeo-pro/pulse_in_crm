class InquiryFormContent < ApplicationRecord
  before_create :set_uuid
  belongs_to :inquiry_form
  has_many :inquiry_form_text_contents, dependent: :destroy
  has_many :inquiry_form_select_contents, dependent: :destroy
  has_many :inquiry_form_radio_box_contents, dependent: :destroy
  has_many :inquiry_form_text_area_contents, dependent: :destroy
  accepts_nested_attributes_for :inquiry_form_text_contents, :inquiry_form_text_area_contents, :inquiry_form_select_contents,
    :inquiry_form_radio_box_contents, allow_destroy: true
end
