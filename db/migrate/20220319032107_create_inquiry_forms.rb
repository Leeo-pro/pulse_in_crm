class CreateInquiryForms < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_forms do |t|

      t.timestamps
    end
  end
end
