class CreateInquiryItemSelects < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_item_selects do |t|
      t.string :name

      t.references :inquiry_form_item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
