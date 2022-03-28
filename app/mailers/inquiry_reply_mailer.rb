class InquiryReplyMailer < ApplicationMailer
  def inquiry_reply(inquiry_reply)
    @inquiry_reply = inquiry_reply
    inquiry_reply.files.each do |file|
      attachments[file.filename] = File.read("public/uploads/#{file.model.class.to_s.underscore}/#{file.mounted_as}/#{file.model.id}/#{file.filename}")
    end
    mail(
      from: ENV['SEND_MAIL'],  #送信元アドレス
      to: inquiry_reply.to_email,       #送信先アドレス
      subject: inquiry_reply.title,  #メールの件名
      bcc: ENV['SEND_MAIL']    #BCC送信先アドレス
    )
  end
end
