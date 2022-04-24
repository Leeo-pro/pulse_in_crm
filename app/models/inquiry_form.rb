class InquiryForm < ApplicationRecord
  before_create :set_uuid

  belongs_to :company
  has_many :inquiries, dependent: :destroy
  has_many :inquiry_form_items, dependent: :destroy
end
