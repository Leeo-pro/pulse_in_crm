class PrivacyPolicy < ApplicationRecord
  before_create :set_uuid

  belongs_to :company
end
