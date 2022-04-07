# frozen_string_literal: true

module Users
  class Base < ApplicationController
    before_action :authenticate_user!
    layout 'users'

    def user_other_access
      redirect_to users_dash_boards_path, flash: { danger: 'アクセス権限がありません' } if current_user.role_other?
    end
  end
end
