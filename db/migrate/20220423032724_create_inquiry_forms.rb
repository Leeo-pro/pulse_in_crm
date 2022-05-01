class CreateInquiryForms < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_forms do |t|
      t.string :title
      
      t.references :company, null: false, foreign_key: true, type: :string
      t.timestamps
    end
  end
end
