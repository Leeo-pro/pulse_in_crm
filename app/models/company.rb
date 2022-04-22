class Company < ApplicationRecord
  before_create :set_uuid

  has_many :users
  has_many :inquiries
  has_one :thank
end
