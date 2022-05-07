class Users::InquiryFormsController < ApplicationController
  before_action :set_user

  def new
    @inquiry_form = InquiryForm.new
  end

  def show
    @company = Company.find_by(id: @user.company_id)
    @inquiry_form = @company.inquiry_forms.order(created_at: :desc).first
    @inquiry_form_content = @inquiry_form.inquiry_form_contents.new
    @inquiry_form_texts = InquiryFormText.where(inquiry_form_id: @inquiry_form.id)
    @inquiry_form_text_areas = InquiryFormTextArea.where(inquiry_form_id: @inquiry_form.id)
    @inquiry_form_selects = InquiryFormSelect.where(inquiry_form_id: @inquiry_form.id)
    @inquiry_form_radio_boxes = InquiryFormRadioBox.where(inquiry_form_id: @inquiry_form.id)
  end

  def create
    @company = Company.find_by(id: @user.company_id)
    @inquiry_form = @company.inquiry_forms.build(create_params)
    if @inquiry_form.save
      redirect_to show_inquiry_forms_path(@company)
    end
  end

  def create_content
    @company = Company.find_by(id: @user.company_id)
    @inquiry_form = @company.inquiry_forms.order(created_at: :desc).first
    @inquiry_form_content = @inquiry_form.inquiry_form_contents.build(create_content_params)
    if @inquiry_form_content.save
      redirect_to show_inquiry_forms_path(@company)
    end
  end

  private

  def create_params
    params.require(:inquiry_form).permit(:title, :company_id,
      inquiry_form_texts_attributes:       %i[id title inquiry_form_id order _destroy],
      inquiry_form_text_areas_attributes:  %i[id title inquiry_form_id order _destroy],
      inquiry_form_radio_boxes_attributes: %i[id title select_item1 select_item2 select_item3 select_item4 select_item5 inquiry_form_id order _destroy],
      inquiry_form_selects_attributes:     %i[id title select_item1 select_item2 select_item3 select_item4 select_item5 inquiry_form_id order _destroy]
    )
  end

  def create_content_params
    params.require(:inquiry_form_content).permit(:inquiry_form_id,
      inquiry_form_text_contents_attributes:      %i[id content inquiry_form_content_id inquiry_form_text_id _destroy],
      inquiry_form_text_area_contents_attributes: %i[id content inquiry_form_content_id inquiry_form_text_area_id _destroy],
      inquiry_form_radio_box_contents_attributes: %i[id content inquiry_form_content_id inquiry_form_radio_box_id _destroy],
      inquiry_form_select_contents_attributes:    %i[id content inquiry_form_content_id inquiry_form_select_id _destroy]
    )
  end

  def set_user
    @user = current_user
  end
end
