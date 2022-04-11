# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      users_dash_boards_path
    when Admin
      admins_dash_boards_path # こちらのpathはまだ存在しないため後ほど要調整
    end
  end

  def configure_permitted_parameters
    added_attrs = %i[email name password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  # システム管理者か判定
  def system_admin_user
    unless current_user.systemadmin?
      flash[:danger] = "アクセス権限がありません。"
      redirect_to users_dash_boards_url
    end
  end

  # 企業ごとの管理者か判定
  def admin_user
    unless current_user.admin?
      flash[:danger] = "アクセス権限がありません。"
      redirect_to users_dash_boards_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認
  def correct_user
    unless current_user?(@user)
      flash[:danger] = "アクセス権限がありません。"
      redirect_to users_dash_boards_url
    end
  end
end
