class CreateInquiryReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiry_replies do |t|
      t.string :title
      t.text :content
      t.string :to_email
      t.json :files

      t.timestamps
    end
  end
end
