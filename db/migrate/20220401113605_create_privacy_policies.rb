class CreatePrivacyPolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :privacy_policies do |t|
      t.text :content
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
