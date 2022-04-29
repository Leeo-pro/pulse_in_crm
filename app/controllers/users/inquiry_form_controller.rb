class Users::InquiryFormController < Users::Base
  def index; end

  def create
    inquiry_form = current_company.inquiry_forms.create!(title: "test")
    inquiry_form_item = inquiry_form.inquiry_form_items.create!(name: 'test', form_type: 0, order: 1)
    inquiry_item_select = inquiry_form_item.inquiry_item_selects.create!(name: 'test')
    inquiry_input_content = inquiry_form_item.inquiry_input_contents.create!(content: 'test')

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
    params.require(:inquiry_form).permit(
      :title, 
      {
        inquiry_form_items_attributes: [
          :id, :name, :type, :order, :_destroy,
          {
            inquiry_item_selects_attributes: [
              :id, :name, :_destroy
            ],
            inquiry_input_contents_attributes: [
              :id, :content, :_destroy
            ]
          }
        ]
      }
    )
  end
end
