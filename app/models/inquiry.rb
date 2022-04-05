class Inquiry < ApplicationRecord
  before_create :set_uuid

  enum status: { 未読: 0, 既読未対応: 1, 既読対応中: 2, 対応済: 3 }, _prefix: :status
end
