class CreateInquiryForms < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_forms, id: :string do |t|
      t.string :title, null: false
      t.string :company_id, null: false
      t.timestamps
    end
  end
end