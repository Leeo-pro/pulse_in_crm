class InquiryMailer < ApplicationMailer
  def send_when_company_reply_mail(current_user, inquiry_reply)
    @user = current_user
    @answer = inquiry_reply.content

    if inquiry_reply.files.present?
      inquiry_reply.files.each do |file|
        attachments[file.filename] = File.read("public/uploads/#{file.model.class.to_s.underscore}/#{file.mounted_as}/#{file.model.id}/#{file.filename}")
      end
    end

    mail to: @user.email, subject: inquiry_reply.title
  end
end
