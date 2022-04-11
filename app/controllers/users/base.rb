# frozen_string_literal: true

module Users
  class Base < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_company_inquiries_notice
    layout 'users'

    def current_company
      current_user.company
    end

    def set_current_company_inquiries_notice
      @inquiry_unread_or_read_unsupporteds = current_company.inquiries.where(status: 0).or(current_company.inquiries.where(status: 1))
      @inquiry_already_supporteds = current_company.inquiries.where(status: 2)
    end

    def user_other_access
      redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' } if current_user.role_other?
    end
  end
end
