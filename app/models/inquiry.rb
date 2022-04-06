class Inquiry < ApplicationRecord
  before_create :set_uuid

  enum status: { unread: 0, read_unsupported: 1, read_supporting: 2, already_supported: 3 }, _prefix: :status
end
