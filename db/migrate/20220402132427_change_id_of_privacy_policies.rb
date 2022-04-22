class ChangeIdOfPrivacyPolicies < ActiveRecord::Migration[6.1]
  def up
    change_column :privacy_policies, :id, :string
  end

  def down
    change_column :privacy_policies, :id, :bigint
  end
end
