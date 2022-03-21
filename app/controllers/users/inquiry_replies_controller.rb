module Users
  class InquiryRepliesController < Users::Base

    def show
    end

    def new
      @inquiry_reply = InquiryReply.new
    end

    def create
      @inquiry_reply = InquiryReply.new(inquiry_reply_params)
      if @inquiry_reply.save
        InquiryReplyMailer.inquiry_reply(@inquiry_reply).deliver  #メール送信処理追加
        redirect_to users_inquiry_reply_url, notice: '返信メールを送信しました'
      else
        flash.now[:alert] = '必須項目を入力、もしくは入力内容に間違いがあります'
        render :new
      end
    end

    private
      def inquiry_reply_params
        params.require(:inquiry_reply).permit(:title, :content)
      end
  end
