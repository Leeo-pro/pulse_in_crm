class CreateInquiryFormTextAreaContents < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_text_area_contents, id: :string do |t|
      t.text :content, null: false
      t.string :inquiry_form_text_area_id, null: false
      t.string :inquiry_form_content_id, null: false
      t.timestamps
    end
  end
end
