class Users::InquiryFormController < Users::Base
  def index; end

  def create
    inquiry_form = current_company.inquiry_forms.create!
    inquiry_form_item = inquiry_form.inquiry_form_items.create!
    inquiry_form_item.inquiry_item_selects.create!
    inquiry_form_item.inquiry_input_contents.create!

    redirect_to edit_users_inquiry_form_url(inquiry_form)
  end

  def show; end

  def edit
    @inquiry_form = current_company.inquiry_forms.find(params[:id])
  end

  def update
    @inquiry_form = current_company.inquiry_forms.find(params[:id])
    if @inquiry_form.update(inquiry_form_params)
      flash[:success] = 'お問合せフォームの作成を完了しました'
      redirect_to users_inquiry_form_url(@inquiry_form)
    else
      render 'edit'
    end
  end

  private

  def inquiry_form_params
    params.require(:inquiry_form).permit(:title)
  end
end
