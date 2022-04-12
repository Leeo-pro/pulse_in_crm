class PrivacyPolicyController < ApplicationController
  def show
    @privacy_policy = PrivacyPolicy.find(params[:id])
  end
end
