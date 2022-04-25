class InquiryMailer < ApplicationMailer
  def send_when_company_reply_mail(current_user, inquiry_reply)
    @user = current_user
    @answer = inquiry_reply.content

    mail to: @user.email, subject: inquiry_reply.title
  end

  def send_when_create_inquiry_notification
    @company = params[:company]
    @inquiry = params[:inquiry]

    mail to: @company.email, subject: 'お問い合わせ受信のお知らせ'
  end
end
