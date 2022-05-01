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
    def show
      @users = User.where.not(confirmed_at: nil)
      email_arr = @users.pluck(:email)
      gon.email_arr = email_arr

      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?

      if resource.errors.empty?
        set_flash_message!(:notice, :confirmed)
        respond_with_navigational(resource) { redirect_to after_confirmation_path_for(resource_name, resource) }
      else
        set_flash_message!(:notice, :already_confirmed)
        # rubocop:disable all
        respond_with_navigational(resource.errors, status: :unprocessable_entity) { redirect_to after_confirmation_path_for(resource_name, resource) }
        # rubocop:enable all
      end
    end

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
