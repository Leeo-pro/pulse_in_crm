class AddCompanyIdToInquiries < ActiveRecord::Migration[6.1]
  def change
    add_column :inquiries, :company_id, :string, null: false
  end
end
