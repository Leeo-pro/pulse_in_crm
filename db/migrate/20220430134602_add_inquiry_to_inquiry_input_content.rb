class AddInquiryToInquiryInputContent < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquiry_input_contents, :inquiry, foreign_key: true
  end
end
