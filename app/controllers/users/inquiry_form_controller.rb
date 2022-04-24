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

  def edit; end

  def update; end
end
