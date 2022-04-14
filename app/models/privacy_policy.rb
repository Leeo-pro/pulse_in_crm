class PrivacyPolicy < ApplicationRecord
  before_create :set_uuid

  belongs_to :company
  
  validate :content_has_square, on: :update

  def content_has_square
    errors.add(:content, "■に全て入力してください。") if content.include?("■")
  end
end
