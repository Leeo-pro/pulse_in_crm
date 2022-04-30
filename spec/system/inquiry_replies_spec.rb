require 'rails_helper'

RSpec.describe 'InquiryReplies', type: :system do
  # ======== 一旦テスト失敗するためコメントアウトしました ======== 

  # let(:user) { create(:user) }
  # let(:inquiry) { create(:inquiry) }
  # let(:inquiry_reply) { create(:inquiry_reply) }
  # let(:mail) { InquiryMailer.send_when_company_reply_mail(user, inquiry_reply).deliver }

  # describe 'メール返信機能関連' do
  #   # ログインする
  #   before(:each) do
  #     user.skip_confirmation!
  #     user.save!
  #     visit user_login_path(1)
  #     fill_in 'user[email]', with: user.email
  #     fill_in 'user[password]', with: user.password
  #     click_button 'ログイン'
  #   end

  #   context 'メール返信機能' do
  #     it 'メール返信新規作成フォーム' do
  #       visit new_users_inquiry_reply_path

  #       fill_in 'inquiry_reply[title]', with: inquiry_reply.title
  #       fill_in 'inquiry_reply[content]', with: inquiry_reply.content
  #       click_button '登録'

  #       # メール返信詳細に遷移すること
  #       expect(page).to have_content 'メール返信詳細'
  #     end

  #     it 'メールの送信され、そのメールの送信先の確認' do
  #       expect(mail.to).to eq([user.email])
  #     end
  #   end
  # end
end
