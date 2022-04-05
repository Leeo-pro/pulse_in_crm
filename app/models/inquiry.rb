class Inquiry < ApplicationRecord
  before_create :set_uuid

  # 親テーブル(inquiry_form)作成後に関連付け設定
  # belongs_to :inquiry_form
  has_many :inquiry_input_contents

  enum status: { 未読: 0, 既読未対応: 1, 既読対応中: 2, 対応済: 3 }, _prefix: :status
end
