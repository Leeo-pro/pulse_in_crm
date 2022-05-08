class CreateInquiryFormSelectContents < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_select_contents, id: :string do |t|
      t.integer :content, null: false
      t.string :inquiry_form_select_id, null: false
      t.string :inquiry_form_content_id, null: false
      t.timestamps
    end
  end
end
