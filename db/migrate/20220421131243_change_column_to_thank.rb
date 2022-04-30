class ChangeColumnToThank < ActiveRecord::Migration[6.1]
	# 変更内容
  def up
    change_column :thanks, :id, :string
  end

  # 変更前の状態
  def down
    change_column :thanks, :id, :integer
  end
end
