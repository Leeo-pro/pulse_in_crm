class CreateInqueryReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :inquery_replies do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
