class CreateInquiryFormRadioBoxContents < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_radio_box_contents, id: :string do |t|
      t.integer :content, null: false
      t.string :inquiry_form_radio_box_id, null: false
      t.string :inquiry_form_content_id, null: false
      t.timestamps
    end
  end
end
