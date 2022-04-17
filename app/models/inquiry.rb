class Inquiry < ApplicationRecord
  before_create :set_uuid

  belongs_to :company

  enum status: { unread: 0, read_unsupported: 1, read_supporting: 2, already_supported: 3 }, _prefix: :status

  scope :unreads, -> { where(status: 'unread') }
  scope :read_unsupporteds, -> { where(status: 'read_unsupported') }
  scope :read_supportings, -> { where(status: 'read_supporting') }
end
