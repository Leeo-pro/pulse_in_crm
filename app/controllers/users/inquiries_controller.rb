class Users::InquiriesController < ApplicationController
  def index
    @q = InquiryInputContent.ransack(params[:q])
    @records = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(2)
  end

  def show; end

  def destroy; end
end
