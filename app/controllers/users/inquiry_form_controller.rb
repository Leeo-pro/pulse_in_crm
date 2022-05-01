class Users::InquiryFormController < Users::Base
  before_action :set_inquiry_form, except: %i[index create]

  def index
    @inquiry_forms = current_company.inquiry_forms.order(:id)
  end

  def create
    ActiveRecord::Base.transaction do
      inquiry_form = current_company.inquiry_forms.create!(title: 'Title')
      4.times do |i|
        inquiry_form_item = inquiry_form.inquiry_form_items.create!(name: "InquiryFormItem#{i}", form_type: i, order: i)
        3.times do |e|
          inquiry_form_item.inquiry_item_selects.create!(name: "InquiryItemSelect#{e}")
        end
      end
      redirect_to edit_users_inquiry_form_url(inquiry_form)
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = '登録に失敗しました。再度作成してください。'
    redirect_to users_inquiry_form_index_path
  end

  def show
    @inquiry = @inquiry_form.inquiries.build
  end

  def edit; end

  def update
    if @inquiry_form.update(inquiry_form_params)
      flash[:success] = 'お問合せフォームの作成を完了しました'
      redirect_to users_inquiry_form_url(@inquiry_form)
    else
      render 'edit'
    end
  end

  private

  def set_inquiry_form
    @inquiry_form = InquiryForm.find(params[:id])
  end

  def inquiry_form_params
    params.require(:inquiry_form).permit(:title,
      {
        inquiry_form_items_attributes: [
          :id, :name, :type, :order, :_destroy,
          {
            inquiry_item_selects_attributes:   %i[
              id name _destroy
            ],
            inquiry_input_contents_attributes: %i[
              id content _destroy
            ]
          }
        ]
      }
    )
  end
end
