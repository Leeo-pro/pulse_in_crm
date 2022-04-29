class Company < ApplicationRecord
  before_create :set_uuid

  has_many :users
  has_one :privacy_policy
  has_many :inquiries

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
