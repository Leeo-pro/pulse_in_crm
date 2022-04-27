# frozen_string_literal: true

module Users
  class ConfirmationsController < Devise::ConfirmationsController
    layout 'users_auth'
    # GET /resource/confirmation/new
    def new
      super
      @users = User.where.not(confirmed_at: nil)
      email_arr = @users.pluck(:email)
      gon.email_arr = email_arr
    end

    # POST /resource/confirmation
    def create
      @user = User.find_by(email: params[:user][:email])
      @user.send_confirmation_instructions
      redirect_to registration_comp_path, flash: { success: '送られてくるメールの認証URLからアカウントの認証をしてください。' }
    end

    # GET /resource/confirmation?confirmation_token=abcdef
    # def show
    #   super
    # end

    # protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(_resource_name)
      user_login_url(params[:company_id])
    end

    # The path used after confirmation.
    def after_confirmation_path_for(_resource_name, _resource)
      user_login_url(params[:company_id])
    end
  end
end
