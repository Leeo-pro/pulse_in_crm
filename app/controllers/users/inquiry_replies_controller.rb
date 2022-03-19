module Users
  class InquiryRepliesController < Users::Base
    def new
      @inquiry_reply = InquiryReply.new
    end

    def create
      @inquiry_reply = InquiryReply.new(inquiry_reply_params)
      if @inquiry_reply.save
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
      params.require(:inquiry_reply).permit(:title, :content)
    end
  end
end
