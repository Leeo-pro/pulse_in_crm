class InquiryInputContent < ApplicationRecord

  # 親テーブル(inquiry_form_item)作成後に関連付け設定
  # belongs_to :inquiry_form
  belongs_to :inquiry
end
