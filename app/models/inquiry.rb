class Inquiry < ApplicationRecord
  has_many :inquiry_replies, dependent: :destroy
end
