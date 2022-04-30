class InquiryForm < ApplicationRecord
  before_create :set_uuid
  belongs_to :company
  has_many :inquiry_form_texts, dependent: :destroy
  has_many :inquiry_form_selects, dependent: :destroy
  has_many :inquiry_form_radio_boxes, dependent: :destroy
  has_many :inquiry_form_text_areas, dependent: :destroy
  has_many :inquiry_form_contents, dependent: :destroy
  accepts_nested_attributes_for :inquiry_form_texts, :inquiry_form_text_areas, :inquiry_form_selects, :inquiry_form_radio_boxes, allow_destroy: true
end