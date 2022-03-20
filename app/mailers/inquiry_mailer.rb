class InquiryMailer < ApplicationMailer
  def send_when_company_reply(current_user, inquiry_reply)
    @user = current_user
    @answer = inquiry_reply.content
    mail to: @user.email, subject: '【サイト名】 お問い合わせありがとうございます'
  end
end
