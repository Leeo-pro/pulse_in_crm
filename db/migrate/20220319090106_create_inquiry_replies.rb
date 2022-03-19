class CreateInquiryReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_replies do |t|
      t.string :title
      t.text :content
      t.references :inquiry, foreign_key: true, null: false
      t.timestamps
    end
  end
end
