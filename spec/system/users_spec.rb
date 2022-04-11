require 'rails_helper'

RSpec.describe 'InquiryReplies', type: :system do
  let(:company) { create(:company) }
  let(:user) { create(:user, company: company) }

  describe 'User機能関連' do
    # ログインする
    before(:each) { login(user, company) }

    describe 'その他ユーザー新規作成' do
      context 'フォーム入力値が正常' do
        it 'ユーザーの新規作成が成功' do
          visit new_users_user_path
          fill_in 'user[name]', with: 'test'
          fill_in 'user[email]', with: 'test@email.com'
          fill_in 'user[password]', with: 'Password12110807'
          fill_in 'user[password_confirmation]', with: 'Password12110807'

          check 'user[access_authorization_attributes][inquiry_browse]'
          check 'user[access_authorization_attributes][inqury_reply]'
          check 'user[access_authorization_attributes][inqury_form_setting]'

          click_button '登録'

          # ユーザー詳細に遷移すること
          expect(page).to have_content 'ユーザー詳細'
          expect(page).to have_content 'test'
          expect(page).to have_content 'test@email.com'
        end
      end
    end
  end
end
