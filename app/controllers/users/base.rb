# frozen_string_literal: true

module Users
  class Base < ApplicationController
    before_action :authenticate_user!
    before_action :set_inquiries_notice
    layout 'users'

    def current_company
      current_user.company
    end

    def set_inquiries_notice
      # とりあえずローカル変数をここに定義していますが、別タスクでインスタンス変数定義する？？
      inquiries = current_company.inquiries
      # Inquiryモデルにscope定義
      @unread_or_read_unsupporteds = inquiries.unreads.or(inquiries.read_unsupporteds).order(updated_at: :asc)
      @read_supportings = inquiries.read_supportings
    end

    def user_other_access
      redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' } if current_user.role_other?
    end

    # お問い合わせ内容の閲覧制限
    def inquiry_browse_access
      if current_user.role_other? || !current_user.access_authorization.inquiry_browse?
        redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' }
      end
    end

    # お問い合わせ内容返信の制限
    def inquiry_reply_access
      if current_user.role_other? || !current_user.access_authorization.inquiry_reply?
        redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' }
      end
    end

    # お問い合わせフォーム項目設定の制限
    def inquiry_form_setting_access
      if current_user.role_other? || !current_user.access_authorization.inquiry_form_setting?
        redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' }
      end
    end
  end
end
