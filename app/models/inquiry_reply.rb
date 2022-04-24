class InquiryReply < ApplicationRecord
  before_create :set_uuid

  belongs_to :inquiry
end
