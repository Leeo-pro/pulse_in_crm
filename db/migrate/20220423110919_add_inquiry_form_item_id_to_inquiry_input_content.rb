class AddInquiryFormItemIdToInquiryInputContent < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquiry_input_contents, :inquiry_form_item, foreign_key: true
  end
end
