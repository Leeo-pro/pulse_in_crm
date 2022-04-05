# Preview all emails at http://localhost:3000/rails/mailers/inquiry_reply
class InquiryReplyPreview < ActionMailer::Preview
  def inquiry_reply
    inquiry_reply = InquiryReply.new(title: 'テスト', content: '問い合わせメッセージ')

    InquiryReplyMailer.inquiry_reply(inquiry_reply)
  end

  private

  def inquiry_reply_params
    params.require(:inquiry_reply).permit(:title, :content)
  end
end
