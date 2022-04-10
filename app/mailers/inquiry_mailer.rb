class InquiryMailer < ApplicationMailer
  def send_when_company_reply_mail(current_user, inquiry_reply)
    @user = current_user
    @answer = inquiry_reply.content

    mail to: @user.email, subject: inquiry_reply.title
  end
end
