class ChangeIdOfInquiryForms < ActiveRecord::Migration[6.1]
  def up
    change_column :inquiry_forms, :id, :string
  end

  def down
    change_column :inquiry_forms, :id, :integer
  end
end
