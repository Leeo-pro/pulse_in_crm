class CreateAccessAuthorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :access_authorizations do |t|
      t.boolean :inquiry_browse
      t.boolean :inquiry_reply
      t.boolean :inquiry_form_setting
      t.string :user_id, null: false

      t.timestamps
    end
  end
end
