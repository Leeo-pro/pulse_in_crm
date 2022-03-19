class InqueryRepliesController < ApplicationController

  def show
  end

  def new
    @inquiry_reply = Inquiry_reply.new
  end

  def create
    @inquiry_reply = Inquiry_reply.new(inquiry_reply_params)
    if @inquiry_reply.save
      redirect_to users_inquiry_reply_url, notice: '返信メールを送信しました'
    else
      render :new
    end
  end

  private
    def inquiry_reply_params
      params.require(:inquiry_reply).permit(:title, :content)
    end
end
