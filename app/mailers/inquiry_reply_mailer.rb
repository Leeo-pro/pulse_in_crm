class InquiryReplyMailer < ApplicationMailer
  def inquiry_reply(current_user, inquiry_reply)
    @user = current_user
    @inquiry_reply = inquiry_reply

    mail to: @user.email, subject: inquiry_reply.title
  end
end
