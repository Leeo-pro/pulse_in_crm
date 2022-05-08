class CreateInquiryFormContents < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_contents, id: :string do |t|
      t.string :inquiry_form_id, null: false
      t.timestamps
    end
  end
end
