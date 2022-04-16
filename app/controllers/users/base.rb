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
  end
end
