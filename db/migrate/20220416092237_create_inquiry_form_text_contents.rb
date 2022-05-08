class CreateInquiryFormTextContents < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_text_contents, id: :string do |t|
      t.string :content, null: false
      t.string :inquiry_form_text_id, null: false
      t.string :inquiry_form_content_id, null: false
      t.timestamps
    end
  end
end
