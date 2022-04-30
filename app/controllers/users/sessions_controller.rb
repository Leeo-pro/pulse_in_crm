# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout 'users_auth'
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    def create
      self.resource = resource_class.new(sign_in_params)
      user = User.find_by(email: sign_in_params[:email])
      # メール認証されていなかった場合
      if user.confirmed_at.nil?
        flash.now[:alert] = "送付された認証メールからアカウントの認証を行ってください"
        render :new
      # メール認証済みの場合
      else
        self.resource = warden.authenticate!(auth_options)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      end
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
