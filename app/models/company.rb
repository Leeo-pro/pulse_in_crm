class Company < ApplicationRecord
  before_create :set_uuid

  has_many :users
  has_one :privacy_policy
end
