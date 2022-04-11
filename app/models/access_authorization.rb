class AccessAuthorization < ApplicationRecord
  belongs_to :user

  # お問い合わせ内容の閲覧制限
  def inquiry_browse_access
    redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' } unless current_user.access_authorization.inquiry_browse?
  end

  # お問い合わせ内容返信の制限
  def inquiry_reply_access
    redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' } unless current_user.access_authorization.inquiry_reply?
  end

  # お問い合わせフォーム項目設定の制限
  def inquiry_form_setting_access
    redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' } unless current_user.access_authorization.inquiry_form_setting?
  end
end
