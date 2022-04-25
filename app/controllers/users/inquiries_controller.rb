module Users
  class InquiriesController < Users::Base
    # メール通知受信テスト用にデータを作成。運用時はロジック要修正。
    def create
      if inquiry = current_company.inquiries.create
        InquiryMailer.with(company: current_company, inquiry: inquiry)
                     .send_when_create_inquiry_notification.deliver_later
        flash[:success] = "お問い合わせデータが作成されました"
      else
        flash[:danger] = "お問い合わせデータの作成に失敗しました"
      end
      redirect_to users_dash_boards_path
    end
  end
end
