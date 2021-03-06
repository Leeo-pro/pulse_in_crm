# frozen_string_literal: true

module Users
  class PasswordsController < Devise::PasswordsController
    layout 'users_auth'
    # GET /resource/password/new
    # def new
    #   super
    # end

    # POST /resource/password
    def create
      self.resource = resource_class.send_reset_password_instructions(resource_params)
      @company_id = resource.company_id

      respond_with({}, location: user_login_path(@company_id))
      flash[:success] = '送られてくるメールURLからパスワードを再設定してください。'
    end

    # GET /resource/password/edit?reset_password_token=abcdef
    # def edit
    #   super
    # end

    # PUT /resource/password
    # def update
    #   super
    # end

    # protected

    # def after_resetting_password_path_for(resource)
    #   super(resource)
    # end

    # The path used after sending reset password instructions
    # def after_sending_reset_password_instructions_path_for(resource_name)
    #   super(resource_name)
    # end
  end
end
