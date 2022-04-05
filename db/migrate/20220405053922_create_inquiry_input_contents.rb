class CreateInquiryInputContents < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_input_contents do |t|
      t.text :content
      t.references :inquiry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
