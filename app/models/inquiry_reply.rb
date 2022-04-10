class InquiryReply < ApplicationRecord
  before_create :set_uuid
end
