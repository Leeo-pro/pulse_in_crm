class RenameInquryReplyColumnToAccessAuthorizations < ActiveRecord::Migration[6.1]
  def change
    rename_column :access_authorizations, :inqury_reply, :inquiry_reply
    rename_column :access_authorizations, :inqury_form_setting, :inquiry_form_setting
  end
end
