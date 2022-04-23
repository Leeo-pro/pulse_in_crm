class CreateInquiryFormItems < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_form_items do |t|
      t.string :name
      t.integer :type
      t.string :order

      t.references :inquiry_form, null: false, foreign_key: true, type: :string
      t.timestamps
    end
  end
end