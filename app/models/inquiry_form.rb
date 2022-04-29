class InquiryForm < ApplicationRecord
  before_create :set_uuid

  belongs_to :company
  has_many :inquiries, dependent: :destroy
  has_many :inquiry_form_items, dependent: :destroy

  accepts_nested_attributes_for :inquiry_form_items, reject_if: :all_blank, allow_destroy: true
end
