class ChangeIdToUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :id, :string
  end

  def down
    change_column :users, :id, :integer
  end
end
