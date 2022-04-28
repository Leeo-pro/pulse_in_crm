class ChangeColumnToInquiry < ActiveRecord::Migration[6.1]
  def up
    change_column :inquiries, :id, :string
  end

  def down
    change_column :inquiries, :id, :integer
  end
end
