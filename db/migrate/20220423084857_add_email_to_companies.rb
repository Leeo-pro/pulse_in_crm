class AddEmailToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :email, :string, null: false
  end
end
