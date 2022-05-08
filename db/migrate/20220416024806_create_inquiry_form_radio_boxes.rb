class CreateInquiryFormRadioBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_radio_boxes, id: :string do |t|
      t.string :title, null: false
      t.string :select_item1, null: false
      t.string :select_item2, null: false
      t.string :select_item3
      t.string :select_item4
      t.string :select_item5
      t.string :inquiry_form_id, null: false
      t.integer :order, null: false
      t.timestamps
    end
  end
end
