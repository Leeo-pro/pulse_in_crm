class InquiryReplyMailer < ApplicationMailer
  def inquiry_reply(inquiry_reply)
    @inquiry_reply = inquiry_reply
    mail(
      from: ENV['SEND_MAIL'],  #送信元アドレス
      to: inquiry_reply.to_email,       #送信先アドレス
      subject: 'お問い合わせを承りました',  #メールの件名
      bcc: ENV['SEND_MAIL']    #BCC送信先アドレス
    )
  end
end
