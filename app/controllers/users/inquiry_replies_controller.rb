class Users::InquiryRepliesController < Users::Base
  def new
    # テスト用にフォームに文字を入れておきました
    @inquiry_reply = InquiryReply.new(
      title:   'XXXXXXX',
      content: 'XXXXXXX'
    )
  end

  def create
    @inquiry_reply = InquiryReply.new(inquiry_reply_params)
    if @inquiry_reply.save
      # メールを送信する機能。今回は仮にメソッドの変数にcurrent_user、@inquiry_replyを付与
      InquiryMailer.send_when_company_reply_mail(current_user, @inquiry_reply).deliver
      redirect_to users_inquiry_reply_url(@inquiry_reply)
    else
      render 'new'
    end
  end

  def show
    @inquiry_reply = InquiryReply.find(params[:id])
  end

  private

  def inquiry_reply_params
    params.require(:inquiry_reply).permit(:title, :content).merge(to_email: current_user.email) # 仮にcurrent_userのemailを保存
  end
end
