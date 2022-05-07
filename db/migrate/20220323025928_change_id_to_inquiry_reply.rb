class ChangeIdToInquiryReply < ActiveRecord::Migration[6.1]
  def up
    change_column :inquiry_replies, :id, :string
  end

  def down
    change_column :inquiry_replies, :id, :integer
  end
end
