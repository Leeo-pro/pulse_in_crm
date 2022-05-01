class CreateInquiryFormTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_texts, id: :string do |t|
      t.string :title, null: false
      t.string :inquiry_form_id, null: false
      t.integer :order, null: false
      t.timestamps
    end
  end
end