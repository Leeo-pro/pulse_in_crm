class Users::InquiriesController < Users::Base
  # メール通知受信テスト用にデータを作成。
  # お問い合せ作成機能実装時に要修正。
  def create
    inquiry = current_company.inquiries.new
    if inquiry.save
      InquiryMailer.with(company: inquiry.company, inquiry: inquiry)
        .send_when_create_inquiry_notification.deliver_later
      flash[:success] = 'お問い合わせデータが作成されました'
    else
      flash[:danger] = 'お問い合わせデータの作成に失敗しました'
    end
    redirect_to users_dash_boards_path
  end
end
