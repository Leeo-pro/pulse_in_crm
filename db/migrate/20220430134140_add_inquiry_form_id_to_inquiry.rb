class AddInquiryFormIdToInquiry < ActiveRecord::Migration[6.1]
  def change
    add_reference :inquiries, :inquiry_form, foreign_key: true, type: :string
  end
end
